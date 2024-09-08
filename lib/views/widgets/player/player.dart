import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:aniplay/views/widgets/player/player_landscape_controls.dart';

class LandscapePlayer extends StatefulWidget {
  final String vidUrl;
  final Map<String, String> headers;
  const LandscapePlayer(
      {super.key, required this.vidUrl, required this.headers});

  @override
  LandscapePlayerState createState() => LandscapePlayerState();
}

class LandscapePlayerState extends State<LandscapePlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    log(widget.vidUrl);
    log(widget.headers.toString());
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(widget.vidUrl),
          httpHeaders: widget.headers),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.dark.scaffoldBackgroundColor,
      body: Center(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: FlickVideoPlayer(
                flickManager: flickManager,
                preferredDeviceOrientation: const [
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft,
                ],
                systemUIOverlay: const [],
                flickVideoWithControls: FlickVideoWithControls(
                  playerErrorFallback: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "cannot find the file :(",
                              style:
                                  TextStyle(fontSize: 6.sp, letterSpacing: 1.5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  controls: LandscapePlayerControls(
                    iconSize: 20,
                    fontSize: 7.sp,
                  ),
                  playerLoadingFallback: Center(
                    child: CircularProgressIndicator(
                      color: RuntimeController.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
