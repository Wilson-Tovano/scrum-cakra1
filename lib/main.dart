import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:cakra_asset_management/src/pages/landing_page/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(24, 0, 119, 1),
          Color.fromRGBO(54, 0, 0, 1),
        ],
      ),
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset("assets/logo-white.png"),
      ),
      onAnimationEnd: () {
        debugPrint("On Fade In End");
      },
      nextScreen: const LandingPage(),
    );
  }
}
