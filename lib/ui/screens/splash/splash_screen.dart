import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routename = "splashscreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, HomeScreen.routename);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Image.asset(
            AppAssets.splash,
            fit: BoxFit.fill,
          )),
        ],
      ),
    );
  }
}
