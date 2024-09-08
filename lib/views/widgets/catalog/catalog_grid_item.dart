import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/theme_controller.dart';
import 'package:aniplay/views/widgets/details/details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class GridCatalog extends StatelessWidget {
  const GridCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "theme",
        builder: (t) {
          return GetBuilder<CatalogController>(builder: (c) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 5.w),
              itemCount: RuntimeController.posters.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 5.h,
                  childAspectRatio: (3 / 5),
                  crossAxisCount: 3),
              itemBuilder: (context, localindex) {
                // var movieData = c.  var homeScreenData[index].entries.first;
                return GestureDetector(
                  onTapUp: (details) {
                    c.getFilmDetails(
                        RuntimeController.moreDetailsUrls[localindex],
                        localindex);
                    Get.to(
                        FilmDetails(
                          title: RuntimeController.titles[localindex],
                        ),
                        transition: Transition.fade);
                  },
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
                              child: Image.network(
                                RuntimeController.posters[localindex],
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress?.expectedTotalBytes ==
                                      null) {
                                    return child;
                                  } else {
                                    return Container(
                                      color:
                                          const Color.fromARGB(255, 16, 16, 16),
                                    );
                                  }
                                },
                                frameBuilder: (context, child, frame,
                                    wasSynchronouslyLoaded) {
                                  return child;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 2, left: 2),
                            child: Text(
                              RuntimeController.titles[localindex],
                              style: t.isDarkMode
                                  ? Themes.dark.textTheme.titleSmall
                                  : Themes.light.textTheme.titleSmall,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          });
        });
  }
}
