import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class RuntimeController extends GetxController {
  static var sourceBaseUrl =
      "https://raw.githubusercontent.com/seph1709/AniPlay/main/source.json";
  static var itemLoaded = false.obs;
  static var currentPage = 1.obs;
  static var headers = <String, String>{};
  static var vidUrl = "";
  static var progress = 0.obs;
  static var favoriteData = {};
  static var gotoReq = false;
  static var allowVidPlayer = true;
  static var stopLoading = false;
  static var notice = "".obs;
  static var mainVidPageUrl = "";
  static var allowReload = false.obs;
  static var secondaryColor = const Color.fromARGB(255, 255, 17, 0);
  static var secondaryColorFade = const Color.fromARGB(255, 255, 90, 79);
  static var resultItemPerSource = [].obs;
  static List<String> posters = [];
  static List<String> titles = [];
  static List<String> moreDetailsUrls = [];
  static Map selectedFilmData = {};
  static String title = "";
  static int epi = 1;
  static bool preventPlayer = false;
  static bool isDarkMode = false;

  static void reset() {
    progress.value = 0;
    stopLoading = false;
    gotoReq = false;
    allowVidPlayer = true;
    notice.value = "";
    allowReload.value = false;
    preventPlayer = true;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static ThemeMode themeMode() {
    isDarkMode = Hive.box("theme").get("isDarkMode") ?? false;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static void routingCallback(Routing? value) {
    if (value?.previous == "/FilmDetails") {
      RuntimeController.reset();
      log("----- reseted -----");
    }

    log("callback");
  }
}
