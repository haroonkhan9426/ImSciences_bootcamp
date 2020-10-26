import 'package:flutter/material.dart';
import 'package:museum_app/ui/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash Screen'),
            SizedBox(height: 30),
            RaisedButton(
              child: Text('Home Screen'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            )
          ],
        ),
      ),
    ));
  }
}
