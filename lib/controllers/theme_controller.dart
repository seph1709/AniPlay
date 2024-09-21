import 'dart:developer';

import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';

class ThemeController extends GetxController {
  //
  late Box box;
  Future<void> changeTheme() async {
    RuntimeController.isDarkMode = !RuntimeController.isDarkMode;
    Get.changeThemeMode(
        RuntimeController.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    setSystemUIOverlay();
    await box.put('isDarkMode', RuntimeController.isDarkMode);
    await Get.forceAppUpdate();
    log("isDarkMode: ${RuntimeController.isDarkMode}");
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    await Get.forceAppUpdate();
  }

  @override
  void onInit() async {
    box = Hive.box("theme");
    setSystemUIOverlay();
    bool isDarkMode = box.get('isDarkMode') ?? false;
    RuntimeController.isDarkMode = isDarkMode;
    await setTheme(isDarkMode ? ThemeMode.dark : ThemeMode.light);

    super.onInit();
  }

  void setSystemUIOverlay() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: RuntimeController.isDarkMode
              ? Themes.dark.primaryColor
              : Themes.light.primaryColor),
    );
  }
}
