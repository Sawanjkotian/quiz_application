import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(color: Colors.purple),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: Colors.blue.shade200),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
