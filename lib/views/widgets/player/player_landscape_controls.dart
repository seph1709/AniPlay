import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:aniplay/views/widgets/player/player_play_toggle.dart';

class LandscapePlayerControls extends StatelessWidget {
  const LandscapePlayerControls(
      {super.key, this.iconSize = 20, this.fontSize = 12});
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FlickShowControlsAction(
          child: FlickSeekVideoAction(
            child: Center(
              child: FlickVideoBuffer(
                bufferingChild: CircularProgressIndicator(
                  color: RuntimeController.secondaryColor,
                ),
                child: const FlickAutoHideChild(
                  showIfVideoNotInitialized: false,
                  child: LandscapePlayToggle(),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: const Color.fromRGBO(0, 0, 0, 0.4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const FlickPlayToggle(
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FlickCurrentPosition(
                        fontSize: fontSize,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlickVideoProgressBar(
                          flickProgressBarSettings: FlickProgressBarSettings(
                            height: 10,
                            handleRadius: 10,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8,
                            ),
                            backgroundColor: Colors.white24,
                            bufferedColor: Colors.white38,
                            getPlayedPaint: (
                                {double? handleRadius,
                                double? height,
                                double? playedPart,
                                double? width}) {
                              return Paint()
                                ..shader = LinearGradient(colors: [
                                  RuntimeController.secondaryColorFade,
                                  RuntimeController.secondaryColor
                                ], stops: const [
                                  0.0,
                                  0.5
                                ]).createShader(
                                  Rect.fromPoints(
                                    const Offset(0, 0),
                                    Offset(width!, 0),
                                  ),
                                );
                            },
                            getHandlePaint: (
                                {double? handleRadius,
                                double? height,
                                double? playedPart,
                                double? width}) {
                              return Paint()
                                ..shader = RadialGradient(
                                  colors: [
                                    RuntimeController.secondaryColor,
                                    RuntimeController.secondaryColor,
                                    Colors.white,
                                  ],
                                  stops: const [0.0, 0.4, 0.5],
                                  radius: 0.4,
                                ).createShader(
                                  Rect.fromCircle(
                                    center: Offset(playedPart!, height! / 2),
                                    radius: handleRadius!,
                                  ),
                                );
                            },
                          ),
                        ),
                      ),
                      FlickTotalDuration(
                        fontSize: fontSize,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const FlickSoundToggle(
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // Icon(
                      //   Icons.picture_in_picture_rounded,
                      //   size: 20,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   right: 20,
        //   top: 10,
        //   child: GestureDetector(
        //     onTap: () {
        //       SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        //           overlays: SystemUiOverlay.values);
        //       SystemChrome.setPreferredOrientations(
        //           [DeviceOrientation.portraitUp]);
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(
        //       Icons.cancel,
        //       size: 30,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
