import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void OnRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    var screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(onSelectAnswer: chooseAnswer);

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(onRestart: OnRestart, choosenAnswer: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 74, 12, 180),
                Color.fromARGB(255, 88, 31, 185),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
