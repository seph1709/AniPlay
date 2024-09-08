import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;
import 'package:aniplay/models/source_model.dart';
import 'package:aniplay/models/catalog_model.dart';
import 'package:aniplay/controllers/search_controller.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class ElementHandler {
  final String documentRaw;
  final dom.Document document;
  final CatalogController c;
  final int currentTypeIndex;
  final Source originFavSource;

  ElementHandler(
      {required this.documentRaw,
      required this.currentTypeIndex,
      required this.originFavSource})
      : document = parse(documentRaw),
        c = Get.find();

  Current getCurrentType() {
    final type = originFavSource.types.toList[currentTypeIndex];
    return Current.fromJson(type);
  }

  Map getAllItemsElementForCatalog([bool updateCatalog = true]) {
    final allItemSelector =
        originFavSource.types.current.selectAllItems.querySelectorAll.selector;
    final items = document.querySelectorAll(allItemSelector);
    final val = {"posters": [], "titles": [], "detailsUrls": [], "host": []};
    final perTitleElement =
        originFavSource.search.overrideSelectorHomeData?.getTitlePerItem;
    for (var element in items) {
      final posterUrl = getPosterUrl(element);
      final title = getTitleText(element,
          (updateCatalog || perTitleElement == null) ? null : perTitleElement);

      // log(title);
      final detailsUrl = getMoreDetailsUrl(element);
      log(detailsUrl);
      val["posters"]?.add(posterUrl);
      val["titles"]?.add(title);
      val["detailsUrls"]?.add(detailsUrl);

      if (updateCatalog) {
        Items.addItem(posterUrl, title, detailsUrl);
      }
    }
    val["host"]?.add(originFavSource.host);
    if (updateCatalog) {
      RuntimeController.posters = Items.postersUrl;
      RuntimeController.titles = Items.titles;

      RuntimeController.moreDetailsUrls = Items.detailsPageUrls;
      RuntimeController.itemLoaded.value = true;
      return {};
    } else {
      return {originFavSource.name: val};
    }
  }

  String getPosterUrl(dom.Element element) {
    final poster = getCurrentType().getPosterImageUrlPerItem;
    final posterSelector = poster.querySelector.selector;
    final posterAttribute = poster.querySelector.attribute!;
    final posterUrl = element
        .querySelector(posterSelector)!
        .attributes[posterAttribute]
        .toString();
    if (Uri.parse(posterUrl).host.isEmpty) {
      return Uri.https(originFavSource.host, posterUrl).toString();
    } else {
      return posterUrl;
    }
  }

  String getTitleText(dom.Element element, GetTitlePerItem? titlePerItem) {
    final title = titlePerItem ?? getCurrentType().getTitlePerItem;
    final titleSelector = title.querySelector.selector;
    final titleAttribute = title.querySelector.attribute;
    final titleGetText = title.querySelector.getText;
    final titleElement = element.querySelector(titleSelector)!;
    // log(titleElement.outerHtml);
    // log(titleSelector);
    // log(titleGetText.toString());
    var titleText = "null";

    if (titleAttribute != null) {
      titleText = titleElement.attributes[titleAttribute].toString();
    } else if (titleGetText) {
      titleText = titleElement.text;
    }
    return titleText;
  }

  String getMoreDetailsUrl(dom.Element element) {
    //
    final detailsUrl = getCurrentType().getMoreDetailsUrlPerItem;
    final detailsUrlSelector = detailsUrl.querySelector.selector;
    final detailsUrlAttribute = detailsUrl.querySelector.attribute!;
    final detailsElement = element.querySelector(detailsUrlSelector)!;
    return c.urlResolver(
        detailsElement.attributes[detailsUrlAttribute].toString(),
        originFavSource);
  }

  String getDescription([bool fromSearch = false]) {
    GetDescription description;
    final overrideData = originFavSource.search.overrideSelectorHomeData;
    if (overrideData != null && overrideData.getDescription != null) {
      log("has overried description");
      description = overrideData.getDescription!;
    } else {
      description = getCurrentType().moreDetailsPerItem.getDescription;
    }

    final descriptionSelector = description.querySelector.selector;

    final descriptionElement = document.querySelector(descriptionSelector);
    return descriptionElement == null
        ? "No Descriptipn"
        : descriptionElement.text.toString();
  }

  Future<Document> getStreamPageDoc() async {
    final streamPage = originFavSource.streamPage!;
    final selector = streamPage.querySelector.selector;
    final attribute = streamPage.querySelector.attribute;

    final rawUrl =
        document.querySelector(selector)?.attributes[attribute].toString();

    final dio = Dio();

    final url = Uri.parse(rawUrl ?? "")
        .replace(scheme: "https", host: originFavSource.host)
        .toString();
    log(url);
    dynamic result;
    try {
      result = await dio.get(url);
    } catch (e) {
      log(e.toString());
    }

    if (result.statusCode == 200) {
      return parse(result.data.toString());
    } else {
      return document;
    }
  }

  Future<List<String>> getEpisodesUrls([bool fromSearch = false]) async {
    var localDoc = document;
    if ((originFavSource.search.hasStreamPage && fromSearch) ||
        (getCurrentType().streamPage != null && fromSearch == false)) {
      localDoc = await getStreamPageDoc();
    }

    final episodes =
        getCurrentType().moreDetailsPerItem.getCurrentSeasonLinkItems;

    final episodesSelector = episodes.querySelectorAll.selector;
    final episodesAttribute = episodes.querySelectorAll.attribute!;
    final episodesElement = localDoc.querySelectorAll(episodesSelector);
    List<String> episodesUrls = [];

    for (var element in episodesElement) {
      final episodeUrlRaw = element.attributes[episodesAttribute].toString();
      final episodeUrl = Uri.parse(episodeUrlRaw)
          .replace(scheme: "https", host: originFavSource.host)
          .toString();

      episodesUrls.add(episodeUrl);
    }
    if (episodes.reverse) {
      episodesUrls = episodesUrls.reversed.toList();
    }
    log(episodesUrls.toString());

    return episodesUrls;
  }

  getResultItem() {
    final SearchResultController c = Get.find();
    final items = getAllItemsElementForCatalog(false);
    log(items.toString());
    c.resultItemPerSource.add(items);
  }
}
