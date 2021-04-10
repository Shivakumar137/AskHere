import 'package:flutter/material.dart';
import 'package:google_signin_example/models/question.dart';
import '../widget/questionLayout.dart';
import '../dummy_data.dart';

class QuestionScreen extends StatefulWidget {

  // final String categoryTopic;
  // final String categoryTag;
  // final Color color;
  //
  //
  // QuestionScreen({this.categoryTag, this.categoryTopic, this.color});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {



  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, Object>;

    final categoryTopic = routeArgs['title'];
    final color = routeArgs['color'];
    final categoryTag = routeArgs['tag'];

    void addQuestion(String question, int urgency) {
      final ques = Question(
        question: question,
        urgency: urgency,
        category: categoryTopic,
      );

      setState(() {
        DUMMY_QUESTIONS.add(ques);
      });
    }

    void postQuestion(BuildContext ctx) {
      Navigator.of(ctx).pushNamed('/post_question', arguments: {'addQuestion': addQuestion});
    }

    final categoryQuestions = DUMMY_QUESTIONS.where((meal) {
      return meal.category == categoryTopic;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTopic),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return QuestionWidget(categoryQuestions[index]);
      }, itemCount: categoryQuestions.length,),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        child: FloatingActionButton.extended(
          icon: Icon(Icons.file_upload),
          label: Text('Post Question'),
          onPressed: () => postQuestion(context),
        ),
      ),
    );
  }
}
