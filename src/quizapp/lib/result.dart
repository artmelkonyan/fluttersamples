import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;
  Result(this.score, this.reset);

  String get resultPhrase {
    var resultText = 'You did it';
    if (score <= 8) {
      resultText = 'You are awesome innocent';
    } else if (score <= 12) {
      resultText = 'Pretty likeable';
    } else if (score <= 16) {
      resultText = 'You are stange?';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Reset Quiz',     
            ),
            textColor: Colors.blue,
            onPressed: reset,
          )
        ],
      ),
    );
  }
}
