import 'package:flutter/material.dart';
import '../models/question.dart';


class PostQuestion extends StatelessWidget {

  final quesInput = TextEditingController();
  final urgencyInput = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String,Function>;

    void submitData() {
      final enteredQues = quesInput.text;
      final enteredUrg = int.parse(urgencyInput.text);
      if (enteredUrg < 0 || enteredQues.isEmpty) return;

      routeArgs['addQuestion'](enteredQues, enteredUrg);

      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Your Question'),
      ),
      body: Column(
        children: [
          Text('Category'),
          Card(
            elevation: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: quesInput,
                    decoration: InputDecoration(labelText: 'Question'),
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 10,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    controller: urgencyInput,
                    decoration: InputDecoration(labelText: 'Coins'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData(),
                  ),
                  FlatButton(
                    onPressed: submitData,
                    child: Text('Ask Question'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
