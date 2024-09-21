import 'package:get/get.dart';
import 'package:aniplay/controllers/web_controller.dart';
import 'package:aniplay/controllers/theme_controller.dart';
import 'package:aniplay/controllers/catalog_controller.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(CatalogController());
    Get.put(RuntimeController());
    Get.put(ThemeController());
    Get.put(WebController());
  }
}
