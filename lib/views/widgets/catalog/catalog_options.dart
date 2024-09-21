import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/models/user_data_model.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/views/widgets/selection/selection.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(
        id: "options",
        builder: (c) {
          return Container(
            color: RuntimeController.isDarkMode
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
                          color: RuntimeController.isDarkMode
                              ? Themes.dark.iconTheme.color
                              : Themes.light.iconTheme.color,
                        ),
                        Text(
                          c.source.name,
                          style: RuntimeController.isDarkMode
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
                          color: RuntimeController.isDarkMode
                              ? Themes.dark.iconTheme.color
                              : Themes.light.iconTheme.color,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            c.source.types.toList[UserData.selectedType].key,
                            style: RuntimeController.isDarkMode
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
  }
}
