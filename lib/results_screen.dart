import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/questions.dart';
import 'package:flutter_quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.chooseAnswers, {super.key});

  final List<String> chooseAnswers;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'corret_answer': questions[i].answers[0],
        'user_answer': chooseAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var correctAnswersCount = summaryData
        .where((data) => data['user_answer'] == data['corret_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $correctAnswersCount out of 6 questions correctly!"),
            const SizedBox(height: 40),
            QuestionsSummary(summaryData: summaryData),
            TextButton(
              onPressed: () {},
              child: Text("Restart Quiz",
                  style: GoogleFonts.lacquer(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
