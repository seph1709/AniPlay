import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';

class ThemeController extends GetxController {
  //
  late Box box;
  var isDarkMode = false;
  Future<void> changeTheme() async {
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    isDarkMode = !isDarkMode;
    await box.put('isDarkMode', isDarkMode);
    setSystemUIOverlay();
    update(["theme"]);
  }

  @override
  void onInit() async {
    box = Hive.box("theme");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    setSystemUIOverlay();

    if (box.get('isDarkMode') != null) {
      isDarkMode = box.get('isDarkMode');
    }
    super.onInit();
  }

  void setSystemUIOverlay() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            isDarkMode ? Themes.dark.primaryColor : Themes.light.primaryColor));
  }
}
