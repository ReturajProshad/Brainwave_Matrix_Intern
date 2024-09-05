import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  var IsDark = false.obs;
  late Box settingsBox;

  @override
  void onInit() {
    super.onInit();
    settingsBox = Hive.box('settings');
    IsDark.value = settingsBox.get('isDarkMode',
        defaultValue: false); // Load theme from Hive
  }

  void toggleTheme() {
    IsDark.value = !IsDark.value;
    settingsBox.put('isDarkMode', IsDark.value); // Save theme setting in Hive
  }
}
