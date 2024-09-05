import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/controllers/bindings/initialBindings.dart';
import 'package:todo_list_app/controllers/theme_controller.dart';
import 'package:todo_list_app/models/todoModel.dart';
import 'package:todo_list_app/view/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open a box for todos and settings
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());

  await Hive.openBox<TodoModel>('todos'); // Box for storing todos
  await Hive.openBox('settings'); // Box for storing app settings like theme
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          initialBinding: InitialBindings(),
          title: 'TODO  LIST',
          themeMode:
              _themeController.IsDark.value ? ThemeMode.dark : ThemeMode.light,
          home: Homepage(),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blueGrey,
            cardTheme: CardTheme(
              color: Colors.grey[850],
              shadowColor: Colors.green,
            ),
            listTileTheme: const ListTileThemeData(
              textColor: Colors.white,
            ),
          ),
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            cardTheme: CardTheme(
              color: Colors.blueAccent.shade100, // Light theme card color
              shadowColor: Colors.grey, // Light theme shadow
            ),
            listTileTheme: const ListTileThemeData(
              textColor: Colors.black, // Light theme text color
            ),
          ),
        ));
  }
}
