import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:paypal_application/Database/databasehelper.dart';
import 'package:paypal_application/auth/login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:paypal_application/profile/profile_edit.dart';

Color maincolor = Color.fromARGB(255, 216, 221, 234);

class Profile extends StatefulWidget {
  // Profile({super.key});

   var namein;
   var userid;

  Profile({required this.namein, required this.userid});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _selectedImage;
  Future<void> _pickImagefromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImage.path);
    final savedImage = await File(
      pickedImage.path,
    ).copy('${appDir.path}/$fileName');

    setState(() {
      _selectedImage = savedImage;
    });

    await DatabaseHelper.instance.updateUserImage(
      widget.userid,
      savedImage.path,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUserImage();
  }

  Future<void> _loadUserImage() async {
    final user = await DatabaseHelper.instance.getUserById(widget.userid);

    if (user != null && user['image_path'] != null) {
      setState(() {
        _selectedImage = File(user['image_path']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        centerTitle: true,
        title: Text("settings".tr),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: double.infinity,
            height: 300,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.amberAccent),
                  height: 100,
                ),
                Align(
                  alignment: Alignment(0, -0.5),
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : AssetImage("images/3.png") as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: _pickImagefromGallery,
                          child: Container(
                            height: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              color: Color.fromARGB(255, 64, 61, 61),
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.2),
                  child: Text(widget.namein, style: TextStyle(fontSize: 24)),
                ),
                Align(
                  alignment: Alignment(0, 0.4),
                  child: Text(
                    "${widget.namein}@",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.8),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        ProfileEdit(
                          namein: widget.namein,
                          userid: widget.userid,
                        ),
                      );
                    },
                    child: Text("edit".tr),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text("personal_info".tr),
                  trailing: const Icon(Icons.person_outline_sharp),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("login_security".tr),
                  trailing: const Icon(Icons.security_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("privacy_data".tr),
                  trailing: const Icon(Icons.remove_red_eye_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("notification_prefs".tr),
                  trailing: const Icon(Icons.notifications_active_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("marketing_prefs".tr),
                  trailing: Icon(Icons.attach_money_sharp),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text("message_center".tr),
                  trailing: const Icon(Icons.question_answer_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("help".tr, textDirection: TextDirection.rtl),
                  trailing: const Icon(Icons.question_mark),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text("close_account".tr),
                  trailing: const Icon(Icons.delete_outline),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text("logout".tr, textDirection: TextDirection.rtl),
                  trailing: const Icon(Icons.logout),
                  onTap: () {
                    Get.offAll(Login());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "legal_agreements".tr,
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(height: 20),
          Center(child: Text("version".tr)),
        ],
      ),
    );
  }
}
