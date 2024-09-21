// ignore: unused_import
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/web_controller.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingVideoPlayer extends StatefulWidget {
  const LoadingVideoPlayer({super.key});

  @override
  State<LoadingVideoPlayer> createState() => _LoadingVideoPlayerState();
}

class _LoadingVideoPlayerState extends State<LoadingVideoPlayer> {
  @override
  void initState() {
    RuntimeController.preventPlayer = false;
    super.initState();
  }

  @override
  void dispose() async {
    if (Get.previousRoute == "/FilmDetails") {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    RuntimeController.progress.value = 0;
    return Scaffold(
      backgroundColor: RuntimeController.isDarkMode
          ? Themes.dark.primaryColor
          : Themes.light.primaryColor,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: IntrinsicHeight(
              child: Obx(
                () => Column(
                  children: [
                    if (!RuntimeController.allowReload.value)
                      LoadingAnimationWidget.hexagonDots(
                          color: !RuntimeController.isDarkMode
                              ? Themes.dark.highlightColor
                              : Themes.light.primaryColor,
                          size: 80),
                    if (!RuntimeController.allowReload.value)
                      const SizedBox(
                        height: 35,
                      ),
                    if (!RuntimeController.allowReload.value)
                      Obx(
                        () => Text(
                          "${RuntimeController.progress.value} %",
                          style: TextStyle(
                              color: !RuntimeController.isDarkMode
                                  ? Themes.dark.highlightColor
                                  : Themes.light.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    if (RuntimeController.allowReload.value)
                      GestureDetector(
                        onTapUp: (details) async {
                          try {
                            await Get.find<WebController>()
                                .inAppWebViewController
                                .loadUrl(
                                  urlRequest: URLRequest(
                                    url: WebUri(
                                        RuntimeController.mainVidPageUrl),
                                  ),
                                );
                            RuntimeController.notice.value = "reloaded";
                            RuntimeController.allowReload.value = false;
                          } catch (e) {
                            RuntimeController.notice.value = "can't reload";
                          }
                        },
                        child: IntrinsicWidth(
                          child: IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 50),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              color: !RuntimeController.isDarkMode
                                  ? Themes.dark.highlightColor
                                  : Themes.light.primaryColor,
                              child: Text(
                                "reload",
                                style: TextStyle(
                                    color: RuntimeController.isDarkMode
                                        ? Themes.dark.highlightColor
                                        : Themes.light.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Obx(
                      () => Text(
                        RuntimeController.notice.value,
                        style: TextStyle(
                            color: !RuntimeController.isDarkMode
                                ? Themes.dark.highlightColor
                                : Themes.light.primaryColor,
                            fontSize: 15,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
