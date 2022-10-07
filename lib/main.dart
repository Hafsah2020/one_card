import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 158, 25, 202)),
      color: Color.fromARGB(255, 158, 25, 202),
      title: 'one card',
      home: SplashScreen(),
      //initialRoute: SplashScreen.id,
    );
  }
}
