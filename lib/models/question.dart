import 'package:flutter/foundation.dart';

class Question {
  // final String title;
  final String question;
  final List<String> tags;
  final int urgency;
  final String category;
  final bool isAnswered;

  const Question({
    // @required this.title,
    @required this.question,
    @required this.tags,
    @required this.urgency,
    @required this.category,
    this.isAnswered = false,
  });
}
