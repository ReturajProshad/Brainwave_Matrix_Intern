import 'package:get/get.dart';

class ThemeController extends GetxController {
  var IsDark = false.obs;
  void toggleTheme() {
    IsDark.value = !IsDark.value;
  }
}
