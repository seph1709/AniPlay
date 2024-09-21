import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';

import 'package:aniplay/views/widgets/about/about_licenses.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: RuntimeController.isDarkmode
            ? Themes.dark.scaffoldBackgroundColor
            : Themes.light.scaffoldBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      const PackagesLicenses(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 255, 17, 0),
                                Colors.transparent
                              ]),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "About",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: .5,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
