import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/search_controller.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:aniplay/views/widgets/search/search_result_item.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(builder: (c) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Get.isDarkMode
              ? Themes.dark.scaffoldBackgroundColor
              : Themes.light.scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: GetBuilder<SearchResultController>(builder: (s) {
              return Obx(
                () => Center(
                  child: Column(
                    children: [
                      const ResultContainer(),
                      if (s.resultItemPerSource.length != c.sources.length)
                        Center(
                            child: CircularProgressIndicator(
                          color: RuntimeController.secondaryColor,
                        ))
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
