import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/views/widgets/details/details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aniplay/controllers/catalog_controller.dart';

class ItemPoster extends StatelessWidget {
  final int index;
  const ItemPoster({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(builder: (c) {
      return GestureDetector(
        onTapUp: (details) {
          log("from gesture ${c.getOriginHostFromFavorite()[index]}");
          c.getFilmDetails(
              c.getFavoritedetailsPageUrls()[index],
              null,
              c.getFavoriteTItles()[index],
              c.getFavoritePosters()[index],
              c.getOriginHostFromFavorite()[index],
              c.getTypeIndex()[index],
              true);

          // log("meee" + RuntimeController.selectedFilmData.toString());
          Get.to(
              FilmDetails(
                title: c.getFavoriteTItles()[index],
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
                    child: Image.network(c.getFavoritePosters()[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 2, left: 2),
                  child: Text(
                    c.getFavoriteTItles()[index],
                    style: TextStyle(
                        fontSize: 11.5.sp,
                        color: !Get.isDarkMode
                            ? Themes.dark.primaryColor
                            : Themes.light.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand"),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
