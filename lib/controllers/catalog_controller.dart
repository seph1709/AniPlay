import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:aniplay/app.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/service/repo.dart';
import 'package:aniplay/helper/binding.dart';
import 'package:aniplay/models/source_model.dart';
import 'package:aniplay/models/element_model.dart';
import 'package:aniplay/models/user_data_model.dart';
import 'package:aniplay/controllers/web_controller.dart';
import 'package:aniplay/controllers/search_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class CatalogController extends GetxController {
  late Source source;
  late Current currentType;
  late SelectAllItems selectAllItems;
  late ScrollController scrollController;
  late List sources;
  late Current typeForPlayer;
  late Box box;

  @override
  void onInit() async {

    scrollController = ScrollController();

    box = Hive.box('myBox');
    if (box.get('poster') != null) {
      await setAppData();
    }

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getdataSources();
    await getTypeData();
    gotoMyApp();
    super.onReady();
  }

  List<int> getTypeIndex() {
    return UserData.typeIndex;
  }

  List<String> getFavoriteTItles() {
    return UserData.titles;
  }

  List<String> getFavoritePosters() {
    return UserData.postersUrl;
  }

  List<String> getFavoriteDescription() {
    return UserData.descriptions;
  }

  List<dynamic> getFavoriteEpisodeUrls() {
    return UserData.episodeUrls;
  }

  List<String> getFavoritedetailsPageUrls() {
    return UserData.detailsPageUrls;
  }

  List<String> getOriginHostFromFavorite() {
    return UserData.originHost;
  }

  void gotoMyApp() {
    Get.off(const MyApp(), binding: Binding());
  }

  String urlResolver(String url, Source baseSource) {
    return Uri.parse(url)
        .replace(scheme: "https", host: baseSource.host)
        .toString();
  }

  void removeFromFavorite(int index) async {
    UserData.removefavoriteItemFromIndex(index);
    update(["favoriteGrid", "favoriteIcon"]);
    await saveAppData();
  }

  void clearCurrentItemsData() {
    RuntimeController.posters.clear();
    RuntimeController.titles.clear();
    RuntimeController.itemLoaded.value = false;
    RuntimeController.moreDetailsUrls.clear();
    update(["options"]);
  }

  Future<void> changeSourceFromIndex(int index) async {
    try {
      UserData.selectedSource = index;
      UserData.selectedType = 0;
      source = Source.fromJson(sources[index]);
      log(source.host);
      await getdataSources();
      await getTypeData();
    } catch (e) {
      log(e.toString());
    }
  }

  void initTypeForPlayer(Source originSourceFav) {
    typeForPlayer = originSourceFav.types.current;
    Get.find<WebController>().typeForPlayer = typeForPlayer;
  }

  void addToFavorite() async {
    UserData.addToFavoriteFromMap(RuntimeController.selectedFilmData);
    update(["favoriteGrid", "favoriteIcon"]);
    await saveAppData();
  }

  Future<void> saveAppData() async {
    await box.put("poster", UserData.postersUrl);
    await box.put("title", UserData.titles);
    await box.put("url", UserData.detailsPageUrls);
    await box.put("description", UserData.descriptions);
    await box.put("episodeUrlsList", UserData.episodeUrls);
    await box.put("originhost", UserData.originHost);
    await box.put("typeIndex", UserData.typeIndex);
  }

  Future<void> setAppData() async {
    UserData.postersUrl = await box.get("poster");
    UserData.titles = await box.get("title");
    UserData.detailsPageUrls = await box.get("url");
    UserData.descriptions = await box.get("description");
    UserData.episodeUrls = await box.get("episodeUrlsList");
    UserData.originHost = await box.get("originhost");
    UserData.typeIndex = await box.get("typeIndex");
  }

  Future<void> changeTypeFromIndex(int index) async {
    UserData.selectedType = index;
    currentType = Current.fromJson(source.types.toList[UserData.selectedType]);
    selectAllItems = currentType.selectAllItems;
    await getTypeData();
  }

  Future<void> getdataSources() async {
    try {
      source = await Request.getDataSourcesFromConstantBaseUrl();
      currentType = source.types.current;
      selectAllItems = currentType.selectAllItems;
    } catch (e) {
      log(e.toString());
    }
  }

  getSerachItemResult(String value) async {
    final SearchResultController r = Get.find();
    r.resultItemPerSource.clear();
    for (var currentSourceMap in UserData.sources) {
      final body = await Request.getSearchResponseBody(
          value, Source.fromJson(currentSourceMap));
      final handler = ElementHandler(
          documentRaw: body,
          currentTypeIndex: 0,
          originFavSource: Source.fromJson(currentSourceMap));
      handler.getResultItem();
    }
  }

  Future<void> getTypeData() async {
    try {
      clearCurrentItemsData();
      final body = await Request.getResponseBodyFromTypeUrl();
      final handler = ElementHandler(
          documentRaw: body,
          currentTypeIndex: UserData.selectedType,
          originFavSource: source);
      handler.getAllItemsElementForCatalog();
    } catch (e) {
      log(e.toString());
    }
  }

  Map<String, dynamic> getSourceBaseFromHost(String originHost) {
    late Map<String, dynamic> currentSource;
    for (var i = 0; i < sources.length; i++) {
      currentSource = sources[i];
      var currentSourceObj = Source.fromJson(currentSource);
      if (currentSourceObj.host == originHost) {
        break;
      }
    }
    return currentSource;
  }

  void setRuntimeSelectedData(
      String url,
      String title,
      String poster,
      String description,
      List<String> episodesUrlsList,
      Source originSourceFav) {
    RuntimeController.selectedFilmData = {
      "url":
          Uri.parse(url).replace(scheme: "https", host: source.host).toString(),
      "title": title,
      "poster": poster,
      "description": description,
      "episodeUrlsList": episodesUrlsList,
      "originhost": originSourceFav.host,
      "typeIndex": UserData.selectedType,
    };
    update(["filmDetailsView"]);
  }

  Future<void> getFilmDetails(
    String url,
    int? indexFromCatalog, [
    String? titleFromFavorite,
    String? posterFromFavotire,
    String? originHost,
    int? typeIndex,
    bool fromSearch = false,
    bool fromFav = false,
  ]) async {
    RuntimeController.selectedFilmData.clear();
    log("origin $originHost");
    final originSourceFav =
        Source.fromJson(getSourceBaseFromHost(originHost ?? source.host));
    log(originSourceFav.host.toString());
    initTypeForPlayer(originSourceFav);
    setSelectedFilmData(
        url,
        indexFromCatalog,
        originSourceFav,
        titleFromFavorite,
        posterFromFavotire,
        originHost,
        typeIndex,
        fromSearch,
        fromFav);
  }

  void setSelectedFilmData(
      String url,
      int? indexFromCatalog,
      Source originSourceFav,
      String? titleFromFavorite,
      String? posterFromFavotire,
      String? originHost,
      int? typeIndex,
      bool fromSearch,
      bool fromFav) async {
    String body;
    ElementHandler handler;
    String title;
    String poster;
    String description;
    List<String> episodesUrlsList;
    body = await Request.getResponseBodyFilmDetails(
        url, originHost ?? originSourceFav.host);
    handler = ElementHandler(
        documentRaw: body,
        currentTypeIndex: typeIndex ?? UserData.selectedType,
        originFavSource: originSourceFav);
    title =
        titleFromFavorite ?? RuntimeController.titles[indexFromCatalog ?? 0];
    poster =
        posterFromFavotire ?? RuntimeController.posters[indexFromCatalog ?? 0];
    description = handler.getDescription(fromSearch);
    log(fromSearch.toString());
    episodesUrlsList = await handler.getEpisodesUrls(fromSearch);
    // log("zzzzzzzzzzzz  " + fromFav.toString() + fromSearch.toString());

    setRuntimeSelectedData(
        url, title, poster, description, episodesUrlsList, originSourceFav);
  }
}
