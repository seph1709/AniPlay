import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/models/user_data_model.dart';

import 'package:aniplay/controllers/catalog_controller.dart';

class SelectionCataglog extends StatelessWidget {
  final String from;

  const SelectionCataglog({super.key, required this.from});

  @override
  Widget build(BuildContext context) {
    final CatalogController c = Get.find();
    List<Widget> header = [
      GestureDetector(
        onTapUp: (details) {
          Get.back();
        },
        child: IntrinsicWidth(
          child: Row(
            children: [
              Icon(
                Icons.arrow_left_rounded,
                color: Get.isDarkMode
                    ? Themes.dark.iconTheme.color
                    : Themes.light.highlightColor,
                size: 70,
              ),
              Text(
                from,
                style: TextStyle(
                    color: !Get.isDarkMode
                        ? Themes.dark.primaryColor
                        : Themes.light.primaryColor,
                    fontSize: 25),
              )
            ],
          ),
        ),
      ),
    ];

    for (var i = 0;
        i < (from == "types" ? c.source.types.toMap.length : c.sources.length);
        i++) {
      final baseName = from == "types"
          ? c.source.types.toMap.keys.toList()[i]
          : c.sources[i]["name"];
      header.add(
        InkWell(
          onTapUp: (details) {
            //
            if (from == "types") {
              c.changeTypeFromIndex(i);
            } else {
              c.changeSourceFromIndex(i);
            }
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  baseName,
                  style: Get.isDarkMode
                      ? Themes.dark.textTheme.titleMedium
                      : Themes.light.textTheme.titleMedium,
                ),
                if ((from == "types"
                        ? c.source.types.toList[UserData.selectedType].key
                        : c.sources[UserData.selectedSource]["name"]) ==
                    baseName)
                  Icon(
                    Icons.arrow_left_rounded,
                    size: 50,
                    color: Get.isDarkMode
                        ? Themes.dark.iconTheme.color
                        : Themes.light.iconTheme.color,
                  ),
              ],
            ),
          ),
        ),
      );
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Get.isDarkMode
            ? Themes.dark.scaffoldBackgroundColor
            : Themes.light.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: header,
          ),
        ),
      ),
    );
  }
}
