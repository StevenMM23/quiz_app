import 'package:flutter/cupertino.dart';

class QuestionSummary extends StatelessWidget {

    const QuestionSummary(this.summaryData, {super.key});

    final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(children:
          summaryData.map((data) {
            return Row(children: [
              Text(((data['question_index'] as int) + 1).toString()),
              Expanded (
                child: Column(children: [
                  Text(data['question'] as String),
                  SizedBox(height: 5,),
                  Text(data["user_answer"].toString()),
                  Text(data["correct_answer"].toString()),

                ],),
              )
            ],
            );
          } ).toList(),
    );
  }
}