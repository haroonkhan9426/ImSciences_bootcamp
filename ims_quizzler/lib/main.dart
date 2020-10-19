import 'package:flutter/material.dart';
import 'package:ims_quizzler/models/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Question> questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  int count = 0;

  final tick = Icon(Icons.check, color: Colors.green);

  final cross = Icon(Icons.clear, color: Colors.red);

  List<Widget> result = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                questions[count].text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(
                  color: Color(0xFF84B764),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'TRUE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    if (questions[count].answer == true)
                      result.add(tick);
                    else
                      result.add(cross);
                    count++;
                    setState(() {});
                    print('True button pressed');
                  },
                ),
                SizedBox(height: 10),
                RaisedButton(
                  color: Color(0xFFCE5849),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('FALSE', style: TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    if (questions[count].answer == false)
                      result.add(tick);
                    else
                      result.add(cross);
                    count++;
                    setState(() {});
                    print('False button pressed');
                  },
                ),
                Row(children: result)
              ],
            )
          ],
        ),
      ),
    );
  }
}
