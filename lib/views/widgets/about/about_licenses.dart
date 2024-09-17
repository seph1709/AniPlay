import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class PackagesLicenses extends StatelessWidget {
  const PackagesLicenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              height: 80,
              width: 80,
              "assets/images/logo.png",
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "AniPlay",
              style: TextStyle(
                color: !Get.isDarkMode
                    ? Themes.dark.primaryColor
                    : Themes.light.primaryColor,
                fontSize: 17,
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
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 70, right: 70),
              child: Text(
                "Anime streaming app that only scrapes content from the internet.",
                style: TextStyle(
                  color: !Get.isDarkMode
                      ? Themes.dark.primaryColor
                      : Themes.light.primaryColor,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
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
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "Licenses",
                style: TextStyle(
                    color: !Get.isDarkMode
                        ? Themes.dark.primaryColor
                        : Themes.light.primaryColor,
                    fontSize: 14,
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
                    fontSize: 14,
                    fontFamily: "Quicksand"),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 100),
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
                        child: const Text(
                          "Flutter,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "get,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "http,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "html,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "responsive_grid,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "shimmer,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "loading_animation_widget,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "flutter_inappwebview,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "get_storage,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "url_launcher,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
                        child: const Text(
                          "icons_plus,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 140, 255),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 0, 140, 255),
                              fontSize: 16,
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
