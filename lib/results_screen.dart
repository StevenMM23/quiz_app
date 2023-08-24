import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:quiz_app/data/questions.dart";
import 'package:quiz_app/question_summary.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for(var i =0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index" : i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });

    }
    return summary;
  }
  @override
  build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((element) => element["user_answer"] == element["correct_answer"]).length;
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You Answered ${numCorrectQuestions} out of ${numTotalQuestions} questions correctly!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              QuestionSummary(getSummaryData()),
              SizedBox(height: 30,),
              Text("List of answers and questions..."),
              SizedBox(height: 30,),
              TextButton(onPressed: () {}, child: Text("Restart Quiz!"))
            ]),
      ),
    );
  }
}
