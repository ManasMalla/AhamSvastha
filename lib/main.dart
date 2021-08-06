import 'dart:io';

import 'package:ahamsvastha/screens/landscape/splash_screen.dart'
    as SplashScreenLandscape;
import 'package:ahamsvastha/screens/portrait/splash_screen.dart'
    as SplashScreenPortrait;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';

void main() {
  runApp(const AhamSvasthaApp());
}

class AhamSvasthaApp extends StatelessWidget {
  const AhamSvasthaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      if (Platform.isAndroid | Platform.isIOS) {
        FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
      }
    }

    return MediaQuery.of(context).orientation == Orientation.landscape
        ? SplashScreenLandscape.SplashScreen()
        : SplashScreenPortrait.SplashScreen();
  }
}
