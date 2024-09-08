import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/web_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  void dispose() async {
    log(Get.previousRoute);
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    RuntimeController.progress.value = 0;
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: IntrinsicHeight(
              child: Obx(
                () => Column(
                  children: [
                    if (!RuntimeController.allowReload.value)
                      LoadingAnimationWidget.hexagonDots(
                          color: !Get.isDarkMode
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
                              color: !Get.isDarkMode
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
                              margin: EdgeInsets.only(bottom: 50.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4),
                              color: !Get.isDarkMode
                                  ? Themes.dark.highlightColor
                                  : Themes.light.primaryColor,
                              child: Text(
                                "reload",
                                style: TextStyle(
                                    color: Get.isDarkMode
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
                            color: !Get.isDarkMode
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
