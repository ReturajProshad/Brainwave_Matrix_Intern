import 'package:flutter/material.dart';

class Constants {
  static Constants instants = Constants();
  List<Color> gradient = [Colors.blue, Colors.purple];
  String DrawerImage =
      "https://cdn.pixabay.com/photo/2015/05/31/12/12/coffee-791439_1280.jpg";

  String fromTopHome = "Top Headlines";
  String fromCateGory = "Categories";

  //category body color
  List<Color> catColor = [
    Colors.blue,
    Colors.yellow,
    Colors.pink,
  ];

  ///Category Wise BackGround Color
  Color backgroundColor(String _title) {
    switch (_title) {
      case 'Business':
        return Colors.tealAccent;
      case 'Education':
        return Colors.indigoAccent;
      case 'Weather':
        return Colors.lightBlueAccent;
      case 'Feature':
        return Colors.purpleAccent;
      case 'Sports':
        return Colors.greenAccent;
      case 'Entertainment':
        return Colors.pinkAccent;
      case 'Politics':
        return Colors.redAccent;
      default:
        return const Color.fromARGB(231, 27, 85, 231);
    }
  }
}
