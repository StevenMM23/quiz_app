import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/quiz-logo.png", width: 300, color: Color.fromARGB(
              100, 255, 255, 255),),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 30,),

          OutlinedButton.icon(onPressed: startQuiz , icon: Icon(Icons.arrow_right_alt),label:Text("Start Quiz"), style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,

          ))
        ],
      ),
    );
  }
}
