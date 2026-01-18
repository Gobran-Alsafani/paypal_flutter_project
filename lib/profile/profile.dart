import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:untitled2/auth/login.dart';

Color maincolor = Color.fromARGB(255, 216, 221, 234);

class Profile extends StatefulWidget {
  // Profile({super.key});
  String namein = "";

  Profile({required this.namein});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _selectedImage;
  Future<void> _pickImagefromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
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
        title: const Text("الاعدادات"),
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
                            : AssetImage("images/3.png"),
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
                  child: ElevatedButton(onPressed: () {}, child: Text("تحرير")),
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
                  title: const Text(
                    "البيانات الشخصية",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.person_outline_sharp),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "تسجيل الدخول والحماية",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.security_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "البيانات والخصوصية",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.remove_red_eye_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "تفضيلات الاشعارات",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.notifications_active_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "تفضيلات التسويق",
                    textDirection: TextDirection.rtl,
                  ),
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
                  title: const Text(
                    "مركز الرسائل",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.question_answer_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "المساعدة",
                    textDirection: TextDirection.rtl,
                  ),
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
                  title: const Text(
                    "اغلاق حسابك",
                    textDirection: TextDirection.rtl,
                  ),
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
                  title: const Text(
                    "تسجيل الخروج",
                    textDirection: TextDirection.rtl,
                  ),
                  trailing: const Icon(Icons.logout),
                  onTap: () {
                    Get.offAll(Login());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "الاتفاقيات القانونية",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(height: 20),
          const Center(child: Text("الاصدار:1")),
        ],
      ),
    );
  }
}
