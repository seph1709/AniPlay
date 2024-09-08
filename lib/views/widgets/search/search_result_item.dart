import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/search_controller.dart';
import 'package:aniplay/views/widgets/details/details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aniplay/controllers/catalog_controller.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultController>(builder: (s) {
      return Obx(
        () => Column(
          children: [
            for (var i = 0; i < s.resultItemPerSource.length; i++)
              // for (var n = 0; i < c.resultItemPerSource.length; n++)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      s.resultItemPerSource[i].keys.first,
                      style: TextStyle(
                          color: !Get.isDarkMode
                              ? Themes.dark.primaryColor
                              : Themes.light.primaryColor,
                          fontSize: 19),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  s.resultItemPerSource[i].values.first["posters"].isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 180.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: s.resultItemPerSource[i].values
                                .first["posters"].length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GetBuilder<CatalogController>(
                                  builder: (c) {
                                return GestureDetector(
                                  onTapUp: (details) {
                                    final CatalogController c = Get.find();
                                    log("tapped");
                                    log(s.resultItemPerSource[i].values
                                        .first["detailsUrls"][index]
                                        .toString());

                                    // final host =

                                    c.getFilmDetails(
                                        s.resultItemPerSource[i].values
                                            .first["detailsUrls"][index],
                                        null,
                                        s.resultItemPerSource[i].values
                                            .first["titles"][index],
                                        s.resultItemPerSource[i].values
                                            .first["posters"][index],
                                        s.resultItemPerSource[i].values
                                            .first["host"][0],
                                        null,
                                        true);
                                    Get.to(
                                        FilmDetails(
                                          title: s.resultItemPerSource[i].values
                                              .first["titles"][index],
                                        ),
                                        transition: Transition.fade);
                                  },
                                  child: AspectRatio(
                                    aspectRatio: 3 / 4.7,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 20.w),
                                      child: Column(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 3 / 4,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              child: Image.network(
                                                s.resultItemPerSource[i].values
                                                    .first["posters"][index],
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress
                                                          ?.expectedTotalBytes ==
                                                      null) {
                                                    return child;
                                                  } else {
                                                    return Container(
                                                      color:
                                                          const Color.fromARGB(
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
                                                errorBuilder: (context, error,
                                                    stackTrace) {
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
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            s.resultItemPerSource[i].values
                                                    .first["titles"].isNotEmpty
                                                ? s
                                                    .resultItemPerSource[i]
                                                    .values
                                                    .first["titles"][index]
                                                : "",
                                            style: Get.isDarkMode
                                                ? Themes
                                                    .dark.textTheme.titleSmall
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
                      : SizedBox(
                          height: 20.h,
                        ),
                ],
              ),
          ],
        ),
      );
    });
  }
}
