import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/views/widgets/search/search.dart';
import 'package:aniplay/controllers/theme_controller.dart';
import 'package:aniplay/controllers/search_controller.dart';
import 'package:aniplay/controllers/catalog_controller.dart';

class LogoAndSearchBar extends StatelessWidget {
  const LogoAndSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "theme",
        builder: (t) {
          return GetBuilder<CatalogController>(builder: (c) {
            return Container(
              color: t.isDarkMode
                  ? Themes.dark.scaffoldBackgroundColor
                  : Themes.light.scaffoldBackgroundColor,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 35,
                      height: 35,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 85,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: t.isDarkMode
                                ? Themes.dark.unselectedWidgetColor
                                : Themes.light.unselectedWidgetColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              GetBuilder<SearchResultController>(builder: (s) {
                            return TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.search,
                              focusNode: s.focusNode,
                              controller: s.textController,
                              onEditingComplete: () {},
                              onTapOutside: (event) {
                                s.focusNode.unfocus();
                              },
                              onSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  c.getSerachItemResult(value);
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Get.to(
                                      SearchView(
                                        searchVAlue: value,
                                      ),
                                      transition: Transition.downToUp);
                                }
                              },
                              style: TextStyle(
                                  color: !t.isDarkMode
                                      ? Themes.dark.primaryColor
                                      : Themes.light.primaryColor,
                                  fontSize: 15,
                                  letterSpacing: 1),
                              decoration: InputDecoration.collapsed(
                                hintText: "Search anything...",
                                hintStyle: TextStyle(
                                  color: t.isDarkMode
                                      ? Themes.dark.hintColor
                                      : Themes.light.hintColor,
                                ),
                              ),
                            );
                          }),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.search_rounded,
                              color: Color.fromARGB(255, 140, 140, 140),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTapUp: (details) async {
                      await t.changeTheme();
                    },
                    child: Icon(
                      Icons.light_mode_rounded,
                      color: t.isDarkMode
                          ? Themes.dark.hintColor
                          : Themes.light.highlightColor,
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
