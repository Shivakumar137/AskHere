import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTopic),
      ),
      body: Center(
        child: Text('Category Questions!', style: TextStyle(color: color),),
      ),
    );
  }
}
