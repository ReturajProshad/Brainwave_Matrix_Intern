import 'package:get/get.dart';
import 'package:todo_list_app/controllers/theme_controller.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TodoController()); //
    //Get.put(ThemeController());//
  }
}
