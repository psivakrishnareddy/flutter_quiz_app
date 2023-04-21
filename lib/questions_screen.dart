import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer_button.dart';

import 'package:flutter_quiz_app/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnser) {
    widget.onSelectAnswer(selectedAnser);
    // if (currentQuestionIndex < questions.length - 1) {
    setState(() {
      currentQuestionIndex++;
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...currentQuestion.getShuffledAnswers().map(
                  (answer) {
                    return Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: AnswerButton(
                            answerText: answer,
                            onTap: () => answerQuestion(answer)));
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
