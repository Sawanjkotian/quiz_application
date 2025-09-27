import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/models/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                itemData['user_answer'] as String,
                style: TextStyle(color: Colors.purple),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: TextStyle(color: Colors.blue.shade200),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
