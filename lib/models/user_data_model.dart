// ignore: unused_import
import 'dart:developer';

class UserData {
  static int selectedSource = 0;

  static int selectedType = 0;

  static int selectedPage = 0;

  static List sources = [];

  static List<String> postersUrl = [];

  static List<String> titles = [];

  static List<String> descriptions = [];

  static List<String> tags = [];

  static List<String> dates = [];

  static List<String> detailsPageUrls = [];

  static List<dynamic> episodeUrls = [];

  static List<String> originHost = [];

  static List<int> typeIndex = [];

  static addToFavorite(
    String posterUrl,
    String title,
    String description,
    String detailsPageUrl,
    List<String> episodeUrl,
    String originhost,
    int typeindex,
  ) {
    postersUrl.add(posterUrl);
    titles.add(title);
    descriptions.add(description);
    episodeUrls.add(episodeUrl);
    originHost.add(originhost);
    typeIndex.add(typeindex);
  }

  static addToFavoriteFromMap(Map data) {
    postersUrl.add(data["poster"]);
    titles.add(data["title"]);
    detailsPageUrls.add(data["url"]);
    descriptions.add(data["description"]);
    episodeUrls.add(data["episodeUrlsList"]);
    originHost.add(data["originhost"]);
    typeIndex.add(data["typeIndex"]);
  }

  static removefavoriteItemFromIndex(int index) {
    if (titles.isNotEmpty) {
      postersUrl.removeAt(index);
      titles.removeAt(index);
      detailsPageUrls.removeAt(index);
      descriptions.removeAt(index);
      episodeUrls.removeAt(index);
      originHost.removeAt(index);
      typeIndex.remove(index);
    }
  }

  static Map<String, dynamic> favoriteToMap() {
    return {
      "poster": postersUrl,
      "title": titles,
      "url": detailsPageUrls,
      "description": descriptions,
      "episodeUrlsList": episodeUrls,
      "originhost": originHost,
      "typeIndex": typeIndex,
    };
  }

  static void rewriteFavoriteFromMap(Map<String, dynamic> data) {
    postersUrl = data["poster"] as List<String>;
    titles = data["title"] as List<String>;
    detailsPageUrls = data["url"] as List<String>;
    descriptions = data["description"] as List<String>;
    episodeUrls = data["episodeUrlsList"] as List<List<String>>;
    originHost = data["originhost"] as List<String>;
    typeIndex = data["typeIndex"] as List<int>;
  }
  // userData.saveToLocalDataBase() {
  //   //
  // }
}
