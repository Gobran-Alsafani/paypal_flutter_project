import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'paypal_clone.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        phone TEXT,
        password TEXT NOT NULL,
        image_path TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE wallets (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        balance REAL DEFAULT 0,
        currency TEXT DEFAULT 'USD',
        status TEXT DEFAULT 'active'
      )
    ''');

    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender_id INTEGER,
        receiver_id INTEGER,
        amount REAL NOT NULL,
        type TEXT,
        status TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE cards (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        card_type TEXT,
        last4 TEXT,
        expiry TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE bank_accounts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        bank_name TEXT,
        iban TEXT,
        status TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE notifications (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        title TEXT,
        body TEXT,
        is_read INTEGER DEFAULT 0,
        created_at TEXT
      )
    ''');
  }

  // ================= USERS =================
  Future<int> insertUser(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('users', data);
  }

  Future<Map<String, dynamic>?> loginUser(String input, String password) async {
    final db = await database;

    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: '(email = ? OR phone = ?) AND password = ?',
      whereArgs: [input, input, password],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<void> updateUserImage(int userId, String path) async {
    final db = await database;
    await db.update(
      'users',
      {'image_path': path},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    return res.isNotEmpty ? res.first : null;
  }


  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }

  // ================= WALLETS =================
  Future<int> createWallet(int userId) async {
    final db = await database;
    return await db.insert('wallets', {
      'user_id': userId,
      'balance': 0,
      'currency': 'USD',
      'status': 'active',
    });
  }

  Future<Map<String, dynamic>?> getWallet(int userId) async {
    final db = await database;
    final res = await db.query(
      'wallets',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return res.isNotEmpty ? res.first : null;
  }

  Future<void> updateBalance(int userId, double newBalance) async {
    final db = await database;
    await db.update(
      'wallets',
      {'balance': newBalance},
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  Future<void> adjustBalance(int userId, double changeAmount) async {
  final db = await database;
  
  await db.rawUpdate('''
    UPDATE wallets 
    SET balance = balance + ? 
    WHERE user_id = ?
  ''', [changeAmount, userId]);
}

  // ================= TRANSACTIONS =================
  Future<int> insertTransaction(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('transactions', data);
  }

  Future<List<Map<String, dynamic>>> getTransactions(int userId) async {
    final db = await database;
    return await db.query(
      'transactions',
      where: 'sender_id = ? OR receiver_id = ?',
      whereArgs: [userId, userId],
      orderBy: 'id DESC',
    );
  }

  // ================= NOTIFICATIONS =================
  Future<int> insertNotification(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('notifications', data);
  }

  Future<List<Map<String, dynamic>>> getNotifications(int userId) async {
    final db = await database;
    return await db.query(
      'notifications',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'id DESC',
    );
  }

  Future<int> insertcard(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('cards', data);
  }

}
