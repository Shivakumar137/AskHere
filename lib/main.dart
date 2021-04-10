import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/category_questions_screen.dart';
import './screens/postQuestion.dart';
import './page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  body1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  body2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
              title: TextStyle(fontSize: 20.0, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold,)
                )),
        home: HomePage(),
    routes: {
          '/category_questions': (ctx) => QuestionScreen(),
          '/post_question' : (ctx) => PostQuestion(),

    },
      );
}
