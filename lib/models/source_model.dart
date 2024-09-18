// ignore: unused_import
import 'dart:developer';

class Source {
  final String name;
  final String host;
  final String tag;
  final StreamPage? streamPage;
  final Types types;
  final Search search;

  Source._internal(
      {required this.name,
      required this.host,
      required this.tag,
      required this.streamPage,
      required this.types,
      required this.search});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source._internal(
      name: json["name"],
      host: json["host"],
      tag: json["tag"],
      streamPage: StreamPage.fromJson(json["streamPage"]),
      types: Types.fromJson(json["types"]),
      search: Search.fromJson(json["search"]),
    );
  }
}

class Search {
  final String path;
  final bool hasStreamPage;
  final Map<String, dynamic> query;
  final OverrideSelectorHomeData? overrideSelectorHomeData;

  Search._internal({
    required this.path,
    required this.query,
    required this.hasStreamPage,
    required this.overrideSelectorHomeData,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search._internal(
      path: json["path"],
      query: json["query"],
      hasStreamPage: json["streamPage"] ?? false,
      overrideSelectorHomeData: json["overrideSelectorHomeData"] != null
          ? OverrideSelectorHomeData.fromJson(json["overrideSelectorHomeData"])
          : null,
    );
  }
}

class OverrideSelectorHomeData {
  final GetCurrentSeasonLinkItems? getCurrentSeasonLinkItems;
  final GetTitlePerItem? getTitlePerItem;
  final GetDescription? getDescription;

  OverrideSelectorHomeData._internal({
    required this.getCurrentSeasonLinkItems,
    required this.getTitlePerItem,
    required this.getDescription,
  });

  factory OverrideSelectorHomeData.fromJson(Map<String, dynamic> json) {
    return OverrideSelectorHomeData._internal(
        getCurrentSeasonLinkItems: json["getCurrentSeasonLinkItems"] != null
            ? GetCurrentSeasonLinkItems.fromJson(
                json["getCurrentSeasonLinkItems"])
            : null,
        getTitlePerItem: json["getTitlePerItem"] != null
            ? GetTitlePerItem.fromJson(json["getTitlePerItem"])
            : null,
        getDescription: json["getDescription"] != null
            ? GetDescription.fromJson(json["getDescription"])
            : null);
  }
}

class GetCurrentSeasonLinkItems {
  final QuerySelectorAll querySelectorAll;
  final bool reverse;
  final Goto? goto;
  final ListenHost? listenHost;

  GetCurrentSeasonLinkItems._internal({
    required this.querySelectorAll,
    required this.reverse,
    required this.goto,
    required this.listenHost,
  });

  factory GetCurrentSeasonLinkItems.fromJson(Map<String, dynamic> json) {
    return GetCurrentSeasonLinkItems._internal(
      querySelectorAll: QuerySelectorAll.fromJson(json["querySelectorAll"]),
      reverse: json["reverse"] ?? false,
      goto: json["goto"] != null ? Goto.fromJson(json["goto"]) : null,
      listenHost: json["listenHost"] != null
          ? ListenHost.fromJson(json["listenHost"])
          : null,
    );
  }
}

class ListenHost {
  final String url;
  final String targertExtensionFile;
  final String contains;
  ListenHost._internal(
      {required this.url,
      required this.targertExtensionFile,
      required this.contains});

  factory ListenHost.fromJson(Map<String, dynamic> json) {
    return ListenHost._internal(
        url: json["url"],
        targertExtensionFile: json["targetExtensionFile"],
        contains: json["contains"]);
  }
}

class Goto {
  final String host;
  final String script;

  Goto._internal({required this.host, required this.script});

  factory Goto.fromJson(Map<String, dynamic> json) {
    return Goto._internal(host: json["host"], script: json["script"]);
  }
}

class StreamPage {
  final QuerySelector querySelector;

  StreamPage._internal({required this.querySelector});

  factory StreamPage.fromJson(Map<String, dynamic> json) {
    return StreamPage._internal(
      querySelector: QuerySelector.fromJson(json["querySelector"]),
    );
  }
}

class QuerySelector {
  final String selector;
  final String? attribute;
  final bool getText;

  QuerySelector._internal(
      {required this.selector, required this.attribute, required this.getText});

  factory QuerySelector.fromJson(Map<String, dynamic> json) {
    return QuerySelector._internal(
        selector: json["selector"],
        attribute: json["attribute"],
        getText: json["getText"] ?? false);
  }
}

class QuerySelectorAll {
  final String selector;
  final String? attribute;
  final bool getText;

  QuerySelectorAll._internal({
    required this.selector,
    required this.attribute,
    required this.getText,
  });

  factory QuerySelectorAll.fromJson(Map<String, dynamic> json) {
    return QuerySelectorAll._internal(
      selector: json["selector"],
      attribute: json["attribute"],
      getText: json["getText"] ?? false,
    );
  }
}

class Types {
  final Map<String, dynamic> toMap;
  final Current current;

  Types._internal({required this.toMap, required this.current});

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types._internal(
      toMap: json,
      current: Current.fromJson(json.entries.toList()[0]),
    );
  }

  List<MapEntry<String, dynamic>> get toList => toMap.entries.toList();
}

class Current {
  final String name;
  final String subDirectory;
  final SelectAllItems selectAllItems;
  final GetPosterImageUrlPerItem getPosterImageUrlPerItem;
  final GetTitlePerItem getTitlePerItem;
  final GetMoreDetailsUrlPerItem getMoreDetailsUrlPerItem;
  final MoreDetailsPerItem moreDetailsPerItem;
  final StreamPage? streamPage;

  Current._internal(
      {required this.name,
      required this.subDirectory,
      required this.selectAllItems,
      required this.getPosterImageUrlPerItem,
      required this.getTitlePerItem,
      required this.getMoreDetailsUrlPerItem,
      required this.moreDetailsPerItem,
      required this.streamPage});

  factory Current.fromJson(MapEntry<String, dynamic> type) {
    return Current._internal(
        name: type.key,
        subDirectory: type.value["subdirectory"],
        selectAllItems:
            SelectAllItems.fromJson(type.value["logic"]["selectAllItems"]),
        getPosterImageUrlPerItem: GetPosterImageUrlPerItem.fromJson(
            type.value["logic"]["getPosterImageUrlPerItem"]),
        getTitlePerItem:
            GetTitlePerItem.fromJson(type.value["logic"]["getTitlePerItem"]),
        getMoreDetailsUrlPerItem: GetMoreDetailsUrlPerItem.fromJson(
            type.value["logic"]["getMoreDetailsUrlPerItem"]),
        moreDetailsPerItem: MoreDetailsPerItem.fromJson(
            type.value["logic"]["moreDetailsPerItem"]),
        streamPage: type.value["streamPage"] != null
            ? StreamPage.fromJson(type.value["streamPage"])
            : null);
  }
}

class MoreDetailsPerItem {
  final GetDescription getDescription;
  final GetFilmTag getFilmTag;
  final GetFilmDate getFilmDate;
  final GetCurrentSeasonLinkItems getCurrentSeasonLinkItems;

  MoreDetailsPerItem._internal(
      {required this.getDescription,
      required this.getFilmTag,
      required this.getFilmDate,
      required this.getCurrentSeasonLinkItems});

  factory MoreDetailsPerItem.fromJson(Map<String, dynamic> json) {
    return MoreDetailsPerItem._internal(
      getDescription: GetDescription.fromJson(json["getDescription"]),
      getFilmTag: GetFilmTag.fromJson(json["getFilmTag"]),
      getFilmDate: GetFilmDate.fromJson(json["getFilmDate"]),
      getCurrentSeasonLinkItems:
          GetCurrentSeasonLinkItems.fromJson(json["getCurrentSeasonLinkItems"]),
    );
  }
}

class GetFilmDate {
  final QuerySelector querySelector;
  GetFilmDate._internal({required this.querySelector});
  factory GetFilmDate.fromJson(Map<String, dynamic> json) {
    //
    return GetFilmDate._internal(
      querySelector: QuerySelector.fromJson(json["querySelector"]),
    );
  }
}

class GetFilmTag {
  final QuerySelector querySelector;

  GetFilmTag._internal({required this.querySelector});
  factory GetFilmTag.fromJson(Map<String, dynamic> json) {
    return GetFilmTag._internal(
      querySelector: QuerySelector.fromJson(json["querySelector"]),
    );
  }
}

class GetDescription {
  final QuerySelector querySelector;

  GetDescription._internal({required this.querySelector});
  factory GetDescription.fromJson(Map<String, dynamic> json) {
    return GetDescription._internal(
        querySelector: QuerySelector.fromJson(json["querySelector"]));
  }
}

class GetMoreDetailsUrlPerItem {
  final QuerySelector querySelector;

  GetMoreDetailsUrlPerItem._internal({required this.querySelector});

  factory GetMoreDetailsUrlPerItem.fromJson(Map<String, dynamic> json) {
    return GetMoreDetailsUrlPerItem._internal(
        querySelector: QuerySelector.fromJson(json["querySelector"]));
  }
}

class GetPosterImageUrlPerItem {
  final QuerySelector querySelector;

  GetPosterImageUrlPerItem._internal({required this.querySelector});

  factory GetPosterImageUrlPerItem.fromJson(Map<String, dynamic> json) {
    return GetPosterImageUrlPerItem._internal(
      querySelector: QuerySelector.fromJson(json["querySelector"]),
    );
  }
}

class SelectAllItems {
  final Map toMap;
  final QuerySelectorAll querySelectorAll;

  SelectAllItems._({required this.toMap, required this.querySelectorAll});

  factory SelectAllItems.fromJson(Map<String, dynamic> json) {
    return SelectAllItems._(
      toMap: json,
      querySelectorAll: QuerySelectorAll.fromJson(json["querySelectorAll"]),
    );
  }
}

class GetTitlePerItem {
  final QuerySelector querySelector;

  GetTitlePerItem._internal({required this.querySelector});

  factory GetTitlePerItem.fromJson(Map<String, dynamic> json) {
    return GetTitlePerItem._internal(
      querySelector: QuerySelector.fromJson(json["querySelector"]),
    );
  }
}
