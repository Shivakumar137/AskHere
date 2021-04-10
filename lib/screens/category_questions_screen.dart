import 'package:flutter/material.dart';
import '../widget/questionLayout.dart';
import '../dummy_data.dart';

class QuestionScreen extends StatelessWidget {

  // final String categoryTopic;
  // final String categoryTag;
  // final Color color;
  //
  //
  // QuestionScreen({this.categoryTag, this.categoryTopic, this.color});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,Object>;

    final categoryTopic = routeArgs['title'];
    final color = routeArgs['color'];
    final categoryTag = routeArgs['tag'];

    final categoryQuestions = DUMMY_QUESTIONS.where((meal){
      return meal.category == categoryTopic;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTopic),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
        return QuestionWidget(categoryQuestions[index]);
      },itemCount: categoryQuestions.length,)
      );

  }
}
