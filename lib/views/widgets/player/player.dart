import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class LandscapePlayer extends StatefulWidget {
  final String vidUrl;
  final Map<String, String> headers;
  final String title;
  final int epi;
  const LandscapePlayer(
      {super.key,
      required this.vidUrl,
      required this.headers,
      required this.title,
      required this.epi});

  @override
  LandscapePlayerState createState() => LandscapePlayerState();
}

class LandscapePlayerState extends State<LandscapePlayer> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    log("recieved url: ${widget.vidUrl}\n");
    log("revieved headers: ${widget.headers}\n");
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.dark.scaffoldBackgroundColor,
      body: Center(
        child: YoYoPlayer(
          aspectRatio: 16 / 9,
          url: widget.vidUrl,
          headers: widget.headers,
          title: Row(
            children: [
              SizedBox(
                width: 350,
                child: Text(
                  "#${widget.epi} ${widget.title}",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          qualityOptionPadiingRight: 40,
          videoStyle: VideoStyle(
            qualityButtonAndFullScrIcoSpace: 80,
            linearProgressIndicatorMinHeight: 4,
            fullscreenIcon: const SizedBox.shrink(),
            qualityOptionStyle:
                const TextStyle(fontSize: 14, color: Colors.white),
            qualityStyle: const TextStyle(fontSize: 14, color: Colors.white),
            videoSeekStyle: const TextStyle(fontSize: 14, color: Colors.white),
            videoDurationStyle:
                const TextStyle(fontSize: 14, color: Colors.white),
            playIcon: const Icon(Bootstrap.play_circle,
                size: 35, color: Colors.white),
            pauseIcon: const Icon(Bootstrap.pause_circle,
                size: 35, color: Colors.white),
            forwardIcon: const Icon(Bootstrap.skip_forward,
                size: 30, color: Colors.white),
            backwardIcon: const Icon(Bootstrap.skip_backward,
                size: 30, color: Colors.white),
            bottomBarPadding: const EdgeInsets.only(bottom: 10),
            videoDurationsPadding: const EdgeInsets.only(top: 10),
            allowScrubbing: true,
            spaceBetweenBottomBarButtons: 30,
            progressIndicatorPadding: const EdgeInsets.all(5),
            orientation: [
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
            ],
            qualityOptionsBgColor: const Color.fromARGB(59, 0, 0, 0),
            videoQualityBgColor: const Color.fromARGB(59, 0, 0, 0),
            progressIndicatorColors: VideoProgressColors(
              playedColor: Themes.dark.secondaryHeaderColor,
              bufferedColor: const Color.fromARGB(150, 253, 94, 83),
              backgroundColor: const Color.fromARGB(59, 0, 0, 0),
            ),
          ),
          videoLoadingStyle: VideoLoadingStyle(
            loadingText: "",
            loadingBackgroundColor: Themes.dark.primaryColor,
            loadingIndicatorColor: Themes.dark.secondaryHeaderColor,
            loadingIndicatorValueColor: Themes.dark.secondaryHeaderColor,
          ),
          displayFullScreenAfterInit: true,
        ),
      ),
    );
  }
}
