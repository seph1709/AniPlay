import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/theme_controller.dart';

import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class NavigationBottom extends StatelessWidget {
  final PageController pageController;
  const NavigationBottom({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<ThemeController>(
        id: "theme",
        builder: (t) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: width,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.07,
                ),
              ),
            ),
            child: GetBuilder<CatalogController>(
              id: "navigatorBot",
              builder: (c) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTapUp: (details) {
                        RuntimeController.currentPage.value = 1;
                        pageController.jumpToPage(0);
                        c.update(["navigatorBot", "pageView"]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: RuntimeController.currentPage.value == 1
                                ? Border(
                                    bottom: BorderSide(
                                        color: RuntimeController.secondaryColor,
                                        width: 3))
                                : null),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              IntrinsicWidth(
                                child: Row(
                                  children: [
                                    Text(
                                      "Catalog",
                                      style: TextStyle(
                                          color: RuntimeController
                                                      .currentPage.value ==
                                                  1
                                              ? t.isDarkMode
                                                  ? Themes
                                                      .dark.secondaryHeaderColor
                                                  : Themes.light.highlightColor
                                              : const Color.fromARGB(
                                                  255, 140, 140, 140),
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          fontFamily: "QuicksandBold"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.movie_rounded,
                                      color: RuntimeController
                                                  .currentPage.value ==
                                              1
                                          ? t.isDarkMode
                                              ? Themes.dark.secondaryHeaderColor
                                              : Themes.light.iconTheme.color
                                          : const Color.fromARGB(
                                              255, 140, 140, 140),
                                      size: 20,
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTapUp: (details) {
                        RuntimeController.currentPage.value = 2;
                        pageController.jumpToPage(1);
                        c.update(["navigatorBot", "pageView"]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: RuntimeController.currentPage.value == 2
                                ? Border(
                                    bottom: BorderSide(
                                        color: RuntimeController.secondaryColor,
                                        width: 3))
                                : null),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              IntrinsicWidth(
                                child: Row(
                                  children: [
                                    Text(
                                      "Favorite",
                                      style: TextStyle(
                                          color: RuntimeController
                                                      .currentPage.value ==
                                                  2
                                              ? t.isDarkMode
                                                  ? Themes
                                                      .dark.secondaryHeaderColor
                                                  : Themes.light.highlightColor
                                              : const Color.fromARGB(
                                                  255, 140, 140, 140),
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          fontFamily: "QuicksandBold"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.favorite_rounded,
                                      color: RuntimeController
                                                  .currentPage.value ==
                                              2
                                          ? t.isDarkMode
                                              ? Themes.dark.secondaryHeaderColor
                                              : Themes.light.iconTheme.color
                                          : const Color.fromARGB(
                                              255, 140, 140, 140),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTapUp: (details) {
                        RuntimeController.currentPage.value = 3;
                        pageController.jumpToPage(2);
                        c.update(["navigatorBot", "pageView"]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: RuntimeController.currentPage.value == 3
                                ? Border(
                                    bottom: BorderSide(
                                        color: RuntimeController.secondaryColor,
                                        width: 3))
                                : null),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              IntrinsicWidth(
                                child: Row(
                                  children: [
                                    Text(
                                      "About",
                                      style: TextStyle(
                                          color: RuntimeController
                                                      .currentPage.value ==
                                                  3
                                              ? t.isDarkMode
                                                  ? Themes
                                                      .dark.secondaryHeaderColor
                                                  : Themes.light.highlightColor
                                              : const Color.fromARGB(
                                                  255, 140, 140, 140),
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          fontFamily: "QuicksandBold"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.info_rounded,
                                      color: RuntimeController
                                                  .currentPage.value ==
                                              3
                                          ? t.isDarkMode
                                              ? Themes.dark.secondaryHeaderColor
                                              : Themes.light.iconTheme.color
                                          : const Color.fromARGB(
                                              255, 140, 140, 140),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
