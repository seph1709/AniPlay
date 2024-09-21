import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/web_controller.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:aniplay/views/widgets/player/player_loading.dart';
import 'package:aniplay/views/widgets/details/details_loading.dart';

class FilmDetails extends StatelessWidget {
  final String title;
  const FilmDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final w = Get.find<WebController>();
    return GetBuilder<CatalogController>(
      id: "filmDetailsView",
      builder: (c) {
        return RuntimeController.selectedFilmData.isNotEmpty
            ? MaterialApp(
                home: Scaffold(
                  backgroundColor: RuntimeController.isDarkMode
                      ? Themes.dark.scaffoldBackgroundColor
                      : Themes.light.scaffoldBackgroundColor,
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                          colors: [
                                        Color.fromARGB(255, 10, 10, 10),
                                        Colors.transparent,
                                      ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)
                                      .createShader(Rect.fromLTWH(
                                          0, 0, bounds.width, bounds.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Image.network(
                                  RuntimeController.selectedFilmData["poster"],
                                  width: 400,
                                  height: 350,
                                  fit: BoxFit.cover,
                                  // scale: 0.6,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 280,
                                      child: Text(
                                        RuntimeController
                                            .selectedFilmData["title"],
                                        style: RuntimeController.isDarkMode
                                            ? Themes.dark.textTheme.titleLarge
                                            : Themes.light.textTheme.titleLarge,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        RuntimeController
                                                .selectedFilmData["description"]
                                                .isEmpty
                                            ? "no description for ${RuntimeController.selectedFilmData["title"]}"
                                            : RuntimeController
                                                    .selectedFilmData[
                                                "description"],
                                        style: RuntimeController.isDarkMode
                                            ? Themes.dark.textTheme.bodySmall
                                            : Themes.light.textTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 10,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 30),
                                      padding: const EdgeInsets.all(25),
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: RawScrollbar(
                                        minOverscrollLength: 50,
                                        minThumbLength: 50,
                                        controller: c.scrollController,
                                        thumbColor: !RuntimeController
                                                .isDarkMode
                                            ? Themes.dark.secondaryHeaderColor
                                            : Themes.light.primaryColor,
                                        thumbVisibility: true,
                                        thickness: 4,
                                        crossAxisMargin: -18,
                                        interactive: true,
                                        mainAxisMargin: 40,
                                        // minThumbLength: 50,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color:
                                                    !RuntimeController
                                                            .isDarkMode
                                                        ? Themes.dark
                                                            .secondaryHeaderColor
                                                        : Themes
                                                            .light.primaryColor,
                                                width: 4.0)),
                                        child: GridView.builder(
                                          controller: c.scrollController,
                                          itemCount: RuntimeController
                                              .selectedFilmData[
                                                  "episodeUrlsList"]
                                              .length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 30,
                                                  crossAxisSpacing: 30),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTapUp: (details) async {
                                                RuntimeController.epi =
                                                    index + 1;
                                                Get.to(
                                                    const LoadingVideoPlayer());
                                                await w.headlessWebView.run();
                                                RuntimeController
                                                    .progress.value = 0;
                                                w.inAppWebViewController
                                                    .loadUrl(
                                                  urlRequest: URLRequest(
                                                    url: WebUri(
                                                      RuntimeController
                                                              .selectedFilmData[
                                                          "episodeUrlsList"][index],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: RuntimeController
                                                            .isDarkMode
                                                        ? Themes.dark
                                                            .unselectedWidgetColor
                                                        : Themes.light
                                                            .unselectedWidgetColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  (index + 1).toString(),
                                                  style: TextStyle(
                                                      color: RuntimeController
                                                              .isDarkMode
                                                          ? Themes
                                                              .dark.hintColor
                                                          : Themes
                                                              .light
                                                              .textTheme
                                                              .bodySmall!
                                                              .color,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          "QuicksandBold"),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTapUp: (details) async {
                                if (!c.getFavoriteTItles().contains(title)) {
                                  await c.addToFavorite();
                                  log("added");
                                } else {
                                  final index = c
                                      .getFavoritePosters()
                                      .indexWhere((element) =>
                                          element ==
                                          RuntimeController
                                              .selectedFilmData["poster"]);
                                  if (index >= 0) {
                                    await c.removeFromFavorite(index);
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GetBuilder<CatalogController>(
                                  id: "favoriteIcon",
                                  builder: (context) {
                                    return Icon(
                                      c.getFavoriteTItles().contains(title)
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_outline_rounded,
                                      size: 40,
                                      color:
                                          c.getFavoriteTItles().contains(title)
                                              ? Themes.light.highlightColor
                                              : Colors.white,
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const LoadingFilmDetails();
      },
    );
  }
}
