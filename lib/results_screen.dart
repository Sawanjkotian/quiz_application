import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/models/question_summary.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({
    super.key,
    required this.choosenAnswer,
    required this.onRestart,
  });

  void Function() onRestart;

  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            QuestionSummary(summaryData),
            SizedBox(height: 30),

            TextButton.icon(
              onPressed: () {
                onRestart();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: Text('Restart Quiz'),
              icon: const Icon(Icons.restart_alt),
            ),
          ],
        ),
      ),
    );
  }
}
