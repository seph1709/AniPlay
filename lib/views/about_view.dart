import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aniplay/views/widgets/about/about_licenses.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "theme",
        builder: (_) {
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Get.isDarkMode
                  ? Themes.dark.scaffoldBackgroundColor
                  : Themes.light.scaffoldBackgroundColor,
              body: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.h),
                      child: IntrinsicHeight(
                        child: Stack(
                          children: [
                            const PackagesLicenses(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: 10.h,
                                ),
                                height: 20.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color.fromARGB(255, 255, 17, 0),
                                      Colors.transparent
                                    ]),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  "About",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "QuicksandBold"),
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
        });
  }
}
