import 'dart:convert';
// ignore: unused_import
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:aniplay/models/source_model.dart';
import 'package:aniplay/models/user_data_model.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class Request {
  static Future<Source> getDataSourcesFromConstantBaseUrl() async {
    final CatalogController c = Get.find();
    final response = await http.get(Uri.parse(RuntimeController.sourceBaseUrl));
    if (response.statusCode == 200) {
      c.sources = jsonDecode(response.body);
      UserData.sources = c.sources;
      return Source.fromJson(
          jsonDecode(response.body)[UserData.selectedSource]);
    } else {
      return Source.fromJson({});
    }
  }

  static Future<String> getResponseBodyFromTypeUrl() async {
    final CatalogController c = Get.find();
    final url = Uri.parse(
            c.source.types.toList[UserData.selectedType].value["subdirectory"])
        .replace(scheme: "https", host: c.source.host);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  static Future<String> getResponseBodyFilmDetails(
      String url, String originHost) async {
    final uri = Uri.parse(url).replace(scheme: "https", host: originHost);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  static Future<String> getSearchResponseBody(
      String value, Source currentSource) async {
    final search = currentSource.search;
    final searchPath = search.path;
    final searchQuery = search.query;
    final key = searchQuery.keys.first;
    searchQuery[key] = value;
    dynamic response;

    final host = currentSource.host;
    try {
      response = await http.get(Uri.https(host, searchPath, searchQuery));
    } catch (e) {
      return "";
    }

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
