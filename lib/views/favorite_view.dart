import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/views/widgets/favorite/favorite_item.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "theme",
        builder: (_) {
          return GetBuilder<CatalogController>(builder: (c) {
            return MaterialApp(
              home: Scaffold(
                backgroundColor: Get.isDarkMode
                    ? Themes.dark.scaffoldBackgroundColor
                    : Themes.light.scaffoldBackgroundColor,
                body: SafeArea(
                  child: GetBuilder<CatalogController>(
                      id: "favoriteGrid",
                      builder: (_) {
                        return Stack(
                          children: [
                            c.getFavoriteTItles().isNotEmpty
                                ? GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                            vertical: 50, horizontal: 13)
                                        .h,
                                    itemCount: c.getFavoriteTItles().length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 20.w,
                                            mainAxisSpacing: 5.h,
                                            childAspectRatio: (3 / 5),
                                            crossAxisCount: 3),
                                    itemBuilder: (context, index) {
                                      return ItemPoster(index: index);
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      "EMPTY",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20.sp),
                                    ),
                                  ),
                            Container(
                              padding: EdgeInsets.all(10.h),
                              child: IntrinsicHeight(
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10, right: 0, left: 0),
                                        height: 20.h,
                                        width: 180.w,
                                        decoration: BoxDecoration(
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(255, 255, 17, 0),
                                              Colors.transparent
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Text(
                                          "My Favorites",
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
                        );
                      }),
                ),
              ),
            );
          });
        });
  }
}
