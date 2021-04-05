import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handlerAnswer;
  final String answerText;

  Answer(this.handlerAnswer, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 45.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black12)),
        child: Text(answerText),
        color: Colors.white,
        onPressed: handlerAnswer,
      ),
    );
  }
}
