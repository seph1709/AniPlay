import 'dart:developer';
import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/views/widgets/details/details.dart';

import 'package:aniplay/controllers/catalog_controller.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          for (var i = 0; i < RuntimeController.resultItemPerSource.length; i++)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      RuntimeController.resultItemPerSource[i].keys.first,
                      style: TextStyle(
                          color: !Get.isDarkMode
                              ? Themes.dark.primaryColor
                              : Themes.light.primaryColor,
                          fontSize: 19),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                RuntimeController.resultItemPerSource[i].values.first["posters"]
                        .isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 180,
                        child: ListView.builder(
                          itemCount: RuntimeController.resultItemPerSource[i]
                              .values.first["posters"].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GetBuilder<CatalogController>(builder: (c) {
                              return GestureDetector(
                                onTapUp: (details) {
                                  final CatalogController c = Get.find();

                                  c.getFilmDetails(
                                      RuntimeController.resultItemPerSource[i]
                                          .values.first["detailsUrls"][index],
                                      null,
                                      RuntimeController.resultItemPerSource[i]
                                          .values.first["titles"][index],
                                      RuntimeController.resultItemPerSource[i]
                                          .values.first["posters"][index],
                                      RuntimeController.resultItemPerSource[i]
                                          .values.first["host"][0],
                                      null,
                                      true,
                                      false);

                                  Get.to(
                                      FilmDetails(
                                        title: RuntimeController
                                            .resultItemPerSource[i]
                                            .values
                                            .first["titles"][index],
                                      ),
                                      transition: Transition.fade);
                                },
                                child: AspectRatio(
                                  aspectRatio: 3 / 4.7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 3 / 4,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            child: Image.network(
                                              RuntimeController
                                                  .resultItemPerSource[i]
                                                  .values
                                                  .first["posters"][index],
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress
                                                        ?.expectedTotalBytes ==
                                                    null) {
                                                  return child;
                                                } else {
                                                  return Container(
                                                    color: const Color.fromARGB(
                                                        255, 16, 16, 16),
                                                  );
                                                }
                                              },
                                              frameBuilder: (context,
                                                  child,
                                                  frame,
                                                  wasSynchronouslyLoaded) {
                                                return child;
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                log(error.toString());
                                                log(stackTrace.toString());
                                                return Container(
                                                  color: const Color.fromARGB(
                                                      255, 16, 16, 16),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          RuntimeController
                                                  .resultItemPerSource[i]
                                                  .values
                                                  .first["titles"]
                                                  .isNotEmpty
                                              ? RuntimeController
                                                  .resultItemPerSource[i]
                                                  .values
                                                  .first["titles"][index]
                                              : "",
                                          style: Get.isDarkMode
                                              ? Themes.dark.textTheme.titleSmall
                                              : Themes
                                                  .light.textTheme.titleSmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      )
                    : const SizedBox(
                        height: 20,
                      ),
              ],
            ),
        ],
      ),
    );
  }
}
