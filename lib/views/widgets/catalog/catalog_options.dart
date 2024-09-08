import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/models/user_data_model.dart';
import 'package:aniplay/controllers/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/views/widgets/selection/selection.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "theme",
        builder: (t) {
          return GetBuilder<CatalogController>(
              id: "options",
              builder: (c) {
                return Container(
                  color: t.isDarkMode
                      ? Themes.dark.scaffoldBackgroundColor
                      : Themes.light.scaffoldBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTapUp: (details) {
                          //

                          Get.to(const SelectionCataglog(from: "sources"));
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 45,
                                color: t.isDarkMode
                                    ? Themes.dark.iconTheme.color
                                    : Themes.light.iconTheme.color,
                              ),
                              Text(
                                c.source.name,
                                style: t.isDarkMode
                                    ? Themes.dark.textTheme.titleMedium
                                    : Themes.light.textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTapUp: (details) {
                          Get.to(const SelectionCataglog(from: "types"));
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 45,
                                color: t.isDarkMode
                                    ? Themes.dark.iconTheme.color
                                    : Themes.light.iconTheme.color,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Text(
                                  c.source.types.toList[UserData.selectedType]
                                      .key,
                                  style: t.isDarkMode
                                      ? Themes.dark.textTheme.titleMedium
                                      : Themes.light.textTheme.titleMedium,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
