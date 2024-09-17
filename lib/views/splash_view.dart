import 'package:aniplay/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/helper/binding.dart';

import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ThemeController());
    Get.find<ThemeController>().setSystemUIOverlay();
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: RuntimeController.themeMode(),
      routingCallback: (value) => RuntimeController.routingCallback(value),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: LoadingAnimationWidget.inkDrop(
                    color: RuntimeController.secondaryColor, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
