import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal_application/controller/user_search_controller.dart';
import 'package:paypal_application/send/select_send.dart';

// ignore: must_be_immutable
class Send2 extends StatefulWidget {
  var id;
  var name;
  Send2({super.key, required this.id, required this.name});

  @override
  State<Send2> createState() => _Send2State();
}

class _Send2State extends State<Send2> {
  final TextEditingController searchController = TextEditingController();
  final UserSearchController userSearchController = Get.put(
    UserSearchController(),
  );

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 221, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 216, 221, 234),
        title: TextField(
          controller: searchController,
          onChanged: userSearchController.searchUsers,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.ltr,
            hintText: "Name,username,email,mobile",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => userSearchController.results.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: userSearchController.results.length,
                      itemBuilder: (context, index) {
                        final user = userSearchController.results[index];
                        return ListTile(
                          title: Text(user['name'] ?? ''),
                          subtitle: Text(user['email'] ?? ''),
                          onTap: () {
                            Get.to(
                              SelectSend(
                                id: user['id'],
                                name: user['name'],
                                fromid: widget.id,
                                fromname: widget.name,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(height: 100),
          Center(
            child: Text(
              "find_contacts".tr,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "contact_search_desc".tr,
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_box_outlined, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                "enable_contacts".tr,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
