import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:flutter/material.dart';

class SourcesInstallerPage extends StatelessWidget {
  const SourcesInstallerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: RuntimeController.isDarkMode
            ? Themes.dark.scaffoldBackgroundColor
            : Themes.light.scaffoldBackgroundColor,
        body: const SafeArea(child: Row()),
      ),
    );
  }
}
