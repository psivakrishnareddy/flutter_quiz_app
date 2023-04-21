import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/questions.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';
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
  final List<String> selectedAnsers = [];
  Widget? screenWidget; //? means it can be null too
  String activeScreen = 'start-screen';

  @override
  void initState() {
    activeScreen = 'start-screen';
    screenWidget = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnsers.add(answer);
    if (selectedAnsers.length == questions.length) {
      // selectedAnsers.clear();
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(selectedAnsers);
    }
    return MaterialApp(
      title: "Flutter Quiz App",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Quiz")),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green,
                Colors.lightGreen,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}
