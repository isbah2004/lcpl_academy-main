import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lcpl_academy/reusablewidgets/multicolor_progress_indicator.dart';
import 'package:lcpl_academy/screens/authscreens/login_screen.dart';
import 'package:lcpl_academy/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen(),),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Constants.logo),
            ),
            MulticolorProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
