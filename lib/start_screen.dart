import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});
  void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
        ),
        const SizedBox(height: 80),
        const Text(
          "Learn Flutter the Fun Way!",
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black26,
                padding: const EdgeInsets.all(20)),
            icon: const Icon(Icons.arrow_circle_right),
            label: const Text(
              "Start Quiz!",
              style: TextStyle(color: Colors.white),
            ))
      ]),
    );
  }
}
