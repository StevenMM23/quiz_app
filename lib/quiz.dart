import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];
  String? activeScreen = 'initial-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";

      });
    }
  }

  @override
  Widget build(context) {
    var actualScreen;
    if (activeScreen == "initial-screen") {
      actualScreen = StartScreen(switchScreen);
    }
    if (activeScreen == "question-screen") {
      actualScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == "result-screen") {
      actualScreen = ResultScreen(chosenAnswers: selectedAnswers,);
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: actualScreen)),
    );
  }
}
