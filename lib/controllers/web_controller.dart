import 'dart:developer';
import 'package:get/get.dart';
import 'package:aniplay/models/source_model.dart';
import 'package:aniplay/views/widgets/player/player.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';

class WebController extends GetxController {
  late HeadlessInAppWebView headlessWebView;
  late InAppWebViewController inAppWebViewController;
  late Current typeForPlayer;

  @override
  void onInit() async {
    RuntimeController.notice.value = "setting config..";
    headlessWebView = HeadlessInAppWebView(
      onLoadStart: onloadStart,
      onProgressChanged: onProgressChanged,
      onWebViewCreated: onWebViewCreated,
      initialSettings: InAppWebViewSettings(),
      shouldInterceptRequest: shouldInterceptRequest,
    );
    await headlessWebView.run();
    super.onInit();
  }

  void gotToPlayer() {
    Get.off(
        LandscapePlayer(
            vidUrl: RuntimeController.vidUrl,
            headers: RuntimeController.headers),
        transition: Transition.native);
  }

  Future<void> getResourceAndPlay(dynamic result, Goto gotoData) async {
    RuntimeController.vidUrl = result.toString();
    RuntimeController.allowVidPlayer = false;
    RuntimeController.headers["Referer"] = Uri.https(gotoData.host).toString();
    gotToPlayer();
    await inAppWebViewController.stopLoading();
    RuntimeController.gotoReq = false;
  }

  void onWebViewCreated(controller) {
    inAppWebViewController = controller;
  }

  void onloadStart(controller, url) async {
    log("load started ${url.toString()}");
    await controller.clearFormData();
    await controller.clearHistory();
    await controller.clearSslPreferences();
    await controller.clearFocus();
    RuntimeController.notice.value = "loading url..";
    RuntimeController.vidUrl = "";
    RuntimeController.headers = {};
    RuntimeController.allowVidPlayer = true;
  }

  void onProgressChanged(controller, localprogress) async {
    final url = await inAppWebViewController.getUrl();
    final gotoData =
        typeForPlayer.moreDetailsPerItem.getCurrentSeasonLinkItems.goto;
    final gotoHost = gotoData?.host.toString();

    runTImeProgressChanger(localprogress);
    setMainVidPage(url, gotoHost);
    hasGotoThenProceed(url, gotoHost, gotoData);
    vidUrlResponseHandler(url, gotoData, gotoHost);
  }

  void runTImeProgressChanger(int localprogress) {
    if (RuntimeController.progress.value < localprogress &&
        RuntimeController.stopLoading == false) {
      RuntimeController.progress.value = localprogress;
    }
  }

  void setMainVidPage(WebUri? url, String? gotoHost) {
    if (RuntimeController.progress.value == 100) {
      if (url?.scheme == "https" &&
          (url.toString().contains(gotoHost.toString()))) {
        RuntimeController.mainVidPageUrl = url.toString();
      }
    }
  }

  vidUrlResponseHandler(WebUri? url, Goto? gotoData, String? gotoHost) async {
    if (RuntimeController.progress.value == 100 &&
        !url.toString().contains(gotoHost.toString()) &&
        gotoData != null) {
      final result2 = await inAppWebViewController.evaluateJavascript(
          source: gotoData.script);
      if (result2 != null) {
        getResourceAndPlay(result2, gotoData);
      } else {
        RuntimeController.notice.value = "error null return value";
        RuntimeController.allowReload.value = true;
      }
    }
  }

  void hasGotoThenProceed(WebUri? url, String? gotoHost, Goto? gotoData) async {
    if (url.toString().contains(gotoHost.toString()) &&
        RuntimeController.progress.value == 100 &&
        RuntimeController.allowVidPlayer) {
      RuntimeController.notice.value = "Executing script..";
      var result = await inAppWebViewController.evaluateJavascript(
          source: gotoData!.script);
      if (result == null) {
        RuntimeController.notice.value = "error null return value";

        RuntimeController.allowReload.value = true;
      } else {
        getResourceAndPlay(result, gotoData);
      }
    }
  }

  Future<WebResourceResponse?> shouldInterceptRequest(
      controller, WebResourceRequest request) async {
    RuntimeController.headers = request.headers ?? {};
    //
    final listenData =
        typeForPlayer.moreDetailsPerItem.getCurrentSeasonLinkItems.listenHost;
    final gotoData =
        typeForPlayer.moreDetailsPerItem.getCurrentSeasonLinkItems.goto;

    if (listenData != null) {
      hostVidUrlListener(listenData, request);
    }

    if (gotoData != null) {
      navigateToGotoHost(gotoData, request);
    }

    return null;
  }

  void hostVidUrlListener(
      ListenHost listenData, WebResourceRequest request) async {
    if (RuntimeController.progress.value == 100) {
      RuntimeController.notice.value = "loading..";
    } else {
      RuntimeController.notice.value = "finding media url..";
    }

    final listenHost = listenData.url;
    final targetExtensionFile = listenData.targertExtensionFile;
    final contains = listenData.contains;
    final url = request.url.toString();
    if (url.contains(targetExtensionFile) &&
        request.url.host == listenHost &&
        request.url.path.contains(contains) &&
        RuntimeController.allowVidPlayer) {
      RuntimeController.vidUrl = url;
      RuntimeController.allowVidPlayer = false;
      gotToPlayer();
      await inAppWebViewController.stopLoading();
    }
  }

  void navigateToGotoHost(Goto gotoData, WebResourceRequest request) async {
    final gotoHost = gotoData.host;
    if (request.url.toString().contains(gotoHost) &&
        RuntimeController.gotoReq == false) {
      await inAppWebViewController.stopLoading();
      log("going to");
      RuntimeController.notice.value = " navigating...";
      log(RuntimeController.progress.toString());
      log(request.url.toString());

      RuntimeController.gotoReq = true;
      RuntimeController.stopLoading = true;
      await inAppWebViewController.loadUrl(
        urlRequest: URLRequest(
          url: WebUri(request.url.toString()),
        ),
      );

      RuntimeController.stopLoading = false;
    }
  }
}
