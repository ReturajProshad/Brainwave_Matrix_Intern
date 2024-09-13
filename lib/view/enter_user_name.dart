import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/controllers/constants.dart';
import 'package:todo_list_app/view/homepage.dart';

class EnterUserName extends StatelessWidget {
  EnterUserName({super.key});
  TextEditingController _enterUserName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
        title: Text("Please Enter YourName"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _enterUserName,
              decoration: InputDecoration(
                label: const Text("Enter Your name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String userName = _enterUserName.text.trim();
                if (userName != null) {
                  var settingsBox = Hive.box(constants.instance.settingsHive);
                  settingsBox.put(constants.instance.UserNameHive, userName);

                  constants.instance.user_Name = userName;
                  Get.off(Homepage());
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
