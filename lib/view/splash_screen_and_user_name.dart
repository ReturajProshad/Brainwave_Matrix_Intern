import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/controllers/constants.dart';
import 'package:todo_list_app/view/enter_user_name.dart';
import 'package:todo_list_app/view/homepage.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      var settingsBox = Hive.box(constants.instance.settingsHive);
      String? username = settingsBox.get(constants.instance.UserNameHive);
      if (username != null) {
        constants.instance.user_Name = username;
        Get.off(Homepage());
      } else {
        Get.off(EnterUserName());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(constants.instance.splashImage),
    );
  }
}
