import 'package:flutter/material.dart';
import 'package:museum_app/ui/pages/splash_screen.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
