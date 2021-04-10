import 'package:flutter/material.dart';
import 'package:google_signin_example/models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question categoryQuestion;

  QuestionWidget(this.categoryQuestion);

  IconData getIcon(Question q){
    if(q.isAnswered) return Icons.check_box_rounded;
    else return Icons.check_box_outline_blank;
  }

  int getScore(Question q){
    if(q.isAnswered) return 0;
    else return q.urgency;
  }

  void viewQuestion() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: viewQuestion,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Icon(
                  getIcon(categoryQuestion),
                  color:Colors.green,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [Text(categoryQuestion.question)],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  getScore(categoryQuestion).toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
