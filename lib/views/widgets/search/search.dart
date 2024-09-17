import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/search_controller.dart';

import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/views/widgets/search/search._result.dart';

class SearchView extends StatefulWidget {
  final String searchVAlue;
  const SearchView({super.key, required this.searchVAlue});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController()..text = widget.searchVAlue;
  }

  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(builder: (c) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Get.isDarkMode
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
                        Get.back();
                        final SearchResultController s = Get.find();
                        s.textController.text = '';
                        s.resultItemPerSource.clear();
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
                      height: 55,
                      width: MediaQuery.of(context).size.width - 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? Themes.dark.unselectedWidgetColor
                                  : Themes.light.unselectedWidgetColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GetBuilder<SearchResultController>(
                                builder: (s) {
                              return TextField(
                                focusNode: s.focusNode,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.search,
                                controller: textEditingController,
                                onEditingComplete: () {},
                                onSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    c.getSerachItemResult(value);
                                    Get.to(
                                        SearchView(
                                          searchVAlue: value,
                                        ),
                                        transition: Transition.downToUp);
                                    s.focusNode.unfocus();
                                  }
                                },
                                style: TextStyle(
                                    color: !Get.isDarkMode
                                        ? Themes.dark.primaryColor
                                        : Themes.light.primaryColor,
                                    fontSize: 15,
                                    letterSpacing: 1),
                                decoration: InputDecoration.collapsed(
                                  hintText: "Search anything...",
                                  hintStyle: TextStyle(
                                    color: Get.isDarkMode
                                        ? Themes.dark.hintColor
                                        : Themes.dark.hintColor,
                                  ),
                                ),
                              );
                            }),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTapUp: (details) {
                                textEditingController.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ListenableBuilder(
                                    listenable: textEditingController,
                                    builder: (context, w) {
                                      return Icon(
                                        textEditingController.text.isEmpty
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
