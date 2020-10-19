import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('IMS Counter'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            count++;
            print('Button pressed and new count value is : $count');
            setState(() {});
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Number of times button pressed',
                style: TextStyle(
                  fontSize: 20,
//                fontWeight: FontWeight.bold,
//                color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ));
  }
}
