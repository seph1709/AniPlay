import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';

class LoadingFilmDetails extends StatelessWidget {
  const LoadingFilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Themes.dark.primaryColor : Themes.light.primaryColor,
      body: SingleChildScrollView(
        child: Shimmer.fromColors(
          direction: ShimmerDirection.ttb,
          baseColor: Get.isDarkMode
              ? Themes.dark.unselectedWidgetColor
              : Themes.light.unselectedWidgetColor,
          highlightColor: Get.isDarkMode
              ? Themes.dark.hintColor
              : Themes.light.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Get.isDarkMode
                    ? Themes.dark.primaryColor
                    : Themes.light.primaryColor,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      color: Get.isDarkMode
                          ? Themes.dark.primaryColor
                          : Themes.light.primaryColor,
                      height: 40,
                      width: 150,
                    ),
                    IntrinsicWidth(
                      child: Row(
                        children: [
                          Container(
                            color: Get.isDarkMode
                                ? Themes.dark.primaryColor
                                : Themes.light.primaryColor,
                            height: 20,
                            width: 70,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            color: Get.isDarkMode
                                ? Themes.dark.primaryColor
                                : Themes.light.primaryColor,
                            height: 20,
                            width: 70,
                          ),
                        ],
                      ),
                    ),
                    for (var container in List.generate(
                      10,
                      (index) => Container(
                        margin: const EdgeInsets.only(top: 15),
                        color: Get.isDarkMode
                            ? Themes.dark.primaryColor
                            : Themes.light.primaryColor,
                        height: 15,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ))
                      container,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
