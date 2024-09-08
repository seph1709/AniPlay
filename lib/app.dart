import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/views/about_view.dart';
import 'package:aniplay/views/catalog_view.dart';
import 'package:aniplay/views/favorite_view.dart';
import 'package:aniplay/controllers/theme_controller.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/views/widgets/app_navigation_bottom.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "theme",
        builder: (t) {
          return GetBuilder<CatalogController>(builder: (c) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: t.isDarkMode
                    ? Themes.dark.scaffoldBackgroundColor
                    : Themes.light.scaffoldBackgroundColor,
                bottomNavigationBar: const NavigationBottom(),
                body: Stack(
                  children: [
                    GetBuilder<CatalogController>(
                        id: "pageView",
                        builder: (_) {
                          return PageView(
                            controller: c.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              CatalogView(),
                              Favorite(),
                              About()
                            ],
                          );
                        }),
                    // const NavigationBottom(),
                  ],
                ),
              ),
            );
          });
        });
  }
}
