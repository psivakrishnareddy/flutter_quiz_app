import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

//Prvate class or object props start with _ and each stateful class has 2 classes
// to manage state and render ui
class _Quiz extends State<Quiz> {
  Widget? activeScreen; //? means it can be null too

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Quiz App",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        // appBar: AppBar(title: const Text("Flutter Quiz")),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green,
                Colors.lightGreen,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activeScreen),
      ),
    );
  }
}
