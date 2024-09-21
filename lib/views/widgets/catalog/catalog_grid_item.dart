import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/views/widgets/details/details.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class GridCatalog extends StatelessWidget {
  const GridCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(builder: (c) {
      return GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 5),
        itemCount: RuntimeController.posters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 5,
            childAspectRatio: (3 / 5),
            crossAxisCount: 3),
        itemBuilder: (context, localindex) {
          // var movieData = c.  var homeScreenData[index].entries.first;
          return GestureDetector(
            onTapUp: (details) {
              c.getFilmDetails(
                  RuntimeController.moreDetailsUrls[localindex], localindex);
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
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress?.expectedTotalBytes == null) {
                              return child;
                            } else {
                              return Container(
                                color: const Color.fromARGB(255, 16, 16, 16),
                              );
                            }
                          },
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 2, left: 2),
                      child: Text(
                        RuntimeController.titles[localindex],
                        style: RuntimeController.isDarkMode
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
  }
}
