import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': [
        {'text': 'Black', 'score': 20},
        {'text': 'White', 'score': 20},
        {'text': 'Red', 'score': 10},
        {'text': 'Purple', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite name?',
      'answerText': [
        {'text': 'Odete', 'score': 50},
        {'text': 'Ernesto', 'score': 50},
        {'text': 'Vd', 'score': 40},
        {'text': 'Mack', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s your favorite country?',
      'answerText': [
        {'text': 'London', 'score': 20},
        {'text': 'U.S', 'score': 20},
        {'text': 'Mozambique', 'score': 10},
        {'text': 'South Africa', 'score': 10}
      ]
    }
  ];

  var _questionId = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionId += 1;
      print(_questionId);

      if (_questionId < _questions.length) {
        print('We have more questions');
      } else {
        print('No more questions');
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionId = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            Brightness.light //or set color with: Color(0xFF0000FF)
        ));

    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'Birb',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Lato',
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'QUESTION',
              style: TextStyle(fontSize: 15),
            ),
          ),
          elevation: 0.0,
        ),
        body: _questionId < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionId: _questionId,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
