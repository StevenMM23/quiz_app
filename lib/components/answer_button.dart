import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
class AnswerButton extends StatelessWidget {
  AnswerButton( {super.key, required this.answerText,  required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override

  build(context) {
    return ElevatedButton(onPressed: onTap ,  style: ElevatedButton.styleFrom(

      backgroundColor: const Color.fromARGB(255, 24, 1, 73),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(40)
      )
    ),
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}