import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'dart:async';
import '../constants_and_components.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'Splash Screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet_rounded,
                color: Colors.white, size: 32),
            SizedBox(width: 8),
            Text(
              'One Card',
              style: TextStyle(color: Colors.white, fontSize: 32),
            )
          ],
        ),
      )),
    );
  }
}
