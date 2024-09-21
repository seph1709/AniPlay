import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:aniplay/views/widgets/selection_sources.dart/sources_installer_page.dart';

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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IntrinsicWidth(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_left_rounded,
                    color: RuntimeController.isDarkMode
                        ? Themes.dark.iconTheme.color
                        : Themes.light.highlightColor,
                    size: 70,
                  ),
                ),
                Text(
                  from,
                  style: TextStyle(
                      color: !RuntimeController.isDarkMode
                          ? Themes.dark.primaryColor
                          : Themes.light.primaryColor,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          // if (from == "sources")
          //   GestureDetector(
          //     onTapUp: (details) {
          //       Get.to(const SourcesInstallerPage());
          //     },
          //     child: IntrinsicWidth(
          //       child: Row(
          //         children: [
          //           Text(
          //             "add",
          //             style: TextStyle(
          //                 color: !RuntimeController.isDarkMode
          //                     ? Themes.dark.primaryColor
          //                     : Themes.light.primaryColor,
          //                 fontSize: 18),
          //           ),
          //           Icon(
          //             Icons.add_rounded,
          //             size: 30,
          //             color: RuntimeController.isDarkMode
          //                 ? Themes.dark.iconTheme.color
          //                 : Themes.light.highlightColor,
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           )
          //         ],
          //       ),
          //     ),
          //   )
        ],
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
                  style: RuntimeController.isDarkMode
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
                    color: RuntimeController.isDarkMode
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
        backgroundColor: RuntimeController.isDarkMode
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
