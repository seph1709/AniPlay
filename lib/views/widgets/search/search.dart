import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';

import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/views/widgets/search/search._result.dart';

class SearchView extends StatefulWidget {
  final String searchVAlue;
  final TextEditingController textEditingController;
  const SearchView(
      {super.key,
      required this.searchVAlue,
      required this.textEditingController});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(builder: (c) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: RuntimeController.isDarkMode
              ? Themes.dark.scaffoldBackgroundColor
              : Themes.light.scaffoldBackgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 70, left: 20),
                  child: SearchResult(),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTapUp: (details) {
                        widget.textEditingController.clear();
                        RuntimeController.resultItemPerSource.clear();
                        Get.back();
                      },
                      child: const SizedBox(
                        width: 50,
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 310,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: RuntimeController.isDarkMode
                                  ? Themes.dark.unselectedWidgetColor
                                  : Themes.light.unselectedWidgetColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.search,
                              controller: widget.textEditingController,
                              onEditingComplete: () {},
                              onSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  c.getSerachItemResult(value);
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                              style: TextStyle(
                                  color: !RuntimeController.isDarkMode
                                      ? Themes.dark.primaryColor
                                      : Themes.light.primaryColor,
                                  fontSize: 15,
                                  letterSpacing: 1),
                              decoration: InputDecoration.collapsed(
                                hintText: "Search anything...",
                                hintStyle: TextStyle(
                                  color: RuntimeController.isDarkMode
                                      ? Themes.dark.hintColor
                                      : Themes.dark.hintColor,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTapUp: (details) {
                                widget.textEditingController.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ListenableBuilder(
                                    listenable: widget.textEditingController,
                                    builder: (context, w) {
                                      return Icon(
                                        widget.textEditingController.text
                                                .isEmpty
                                            ? Icons.search_rounded
                                            : Icons.close,
                                        color: const Color.fromARGB(
                                            255, 140, 140, 140),
                                      );
                                    }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
