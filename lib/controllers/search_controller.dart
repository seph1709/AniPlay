import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchResultController extends GetxController {
  //
  var resultItemPerSource = [].obs;
  FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    focusNode = FocusNode();
    textController = TextEditingController();
    super.onInit();
  }

  
}
