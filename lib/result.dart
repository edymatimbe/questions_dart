import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    var resultText;

    if (resultScore <= 50) {
      resultText = 'You are amazing';
    } else if (resultScore <= 100) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 150) {
      resultText = 'You are ... strange';
    } else {
      resultText = 'You embarass me';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
