import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:paypal_application/Database/databasehelper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

// ignore: must_be_immutable
class ProfileEdit extends StatefulWidget {
   var namein;
   var userid;
  ProfileEdit({required this.namein, required this.userid});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
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
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
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
        ],
      ),
    );
  }
}
