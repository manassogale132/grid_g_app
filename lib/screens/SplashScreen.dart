import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'MainGridScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, redirect);
  }

  redirect() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainGridScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset(
            'assets/splashanimation.json',
            animate: true,
            repeat: true,
          ),
        ),
      ),
    );
  }
}
