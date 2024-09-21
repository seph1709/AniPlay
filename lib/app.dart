import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/views/about_view.dart';
import 'package:aniplay/views/catalog_view.dart';
import 'package:aniplay/views/favorite_view.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/views/widgets/app_navigation_bottom.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController pageController;
  @override
  void initState() {
    pageController =
        PageController(initialPage: RuntimeController.currentPage.value - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(builder: (c) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: RuntimeController.isDarkMode
              ? Themes.dark.scaffoldBackgroundColor
              : Themes.light.scaffoldBackgroundColor,
          bottomNavigationBar: NavigationBottom(
            pageController: pageController,
          ),
          body: Stack(
            children: [
              GetBuilder<CatalogController>(
                  id: "pageView",
                  builder: (_) {
                    return PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [CatalogView(), Favorite(), About()],
                    );
                  }),
              // const NavigationBottom(),
            ],
          ),
        ),
      );
    });
  }
}
