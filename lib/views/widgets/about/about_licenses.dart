import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagesLicenses extends StatelessWidget {
  const PackagesLicenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Image.asset(
              height: 80.h,
              width: 80.w,
              "assets/images/logo.png",
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "AniPlay",
              style: TextStyle(
                color: !Get.isDarkMode
                    ? Themes.dark.primaryColor
                    : Themes.light.primaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "version 1.1.3",
                style: TextStyle(
                  color: !Get.isDarkMode
                      ? Themes.dark.primaryColor
                      : Themes.light.primaryColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 70.w, right: 70.w),
              child: Text(
                "Anime streaming app that only scrapes content from the internet.",
                style: TextStyle(
                  color: !Get.isDarkMode
                      ? Themes.dark.primaryColor
                      : Themes.light.primaryColor,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: InkWell(
                onTapUp: (details) async {
                  await launchUrl(
                      Uri.parse('https://github.com/seph1709/AniPlay'));
                },
                // ignore: prefer_const_constructors
                child: Icon(
                  Bootstrap.github,
                  size: 45,
                  color: !Get.isDarkMode
                      ? Themes.dark.primaryColor
                      : Themes.light.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
              ),
              child: Text(
                "Licenses",
                style: TextStyle(
                    color: !Get.isDarkMode
                        ? Themes.dark.primaryColor
                        : Themes.light.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 2,
                    fontFamily: "Quicksand"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: Text(
                "Packages/projects that makes this app possible.",
                style: TextStyle(
                    color: !Get.isDarkMode
                        ? Themes.dark.primaryColor
                        : Themes.light.primaryColor,
                    fontSize: 14.sp,
                    fontFamily: "Quicksand"),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 30.w, right: 30.w, top: 20.h, bottom: 100.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/flutter/flutter/master/LICENSE"));
                        },
                        child: Text(
                          "Flutter,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/jonataslaw/getx/master/LICENSE"));
                        },
                        child: Text(
                          "get,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/dart-lang/http/master/pkgs/http/LICENSE"));
                        },
                        child: Text(
                          "http,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/dart-lang/html/main/LICENSE"));
                        },
                        child: Text(
                          "html,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/muhammad369/ResponsiveGrid_Flutter/master/LICENSE"));
                        },
                        child: Text(
                          "responsive_grid,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/hnvn/flutter_shimmer/master/LICENSE"));
                        },
                        child: Text(
                          "shimmer,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/watery-desert/loading_animation_widget/main/LICENSE"));
                        },
                        child: Text(
                          "loading_animation_widget,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/pichillilorenzo/flutter_inappwebview/master/LICENSE"));
                        },
                        child: Text(
                          "flutter_inappwebview,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/jonataslaw/get_storage/master/LICENSE"));
                        },
                        child: Text(
                          "get_storage,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/flutter/packages/main/packages/url_launcher/url_launcher/LICENSE"));
                        },
                        child: Text(
                          "url_launcher,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTapUp: (details) {
                          launchUrl(Uri.parse(
                              "https://raw.githubusercontent.com/chouhan-rahul/icons_plus/main/LICENSE"));
                        },
                        child: Text(
                          "icons_plus,",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
