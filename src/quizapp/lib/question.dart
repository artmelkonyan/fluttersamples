import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String message;

  Question(this.message);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        fontSize: 28,
      ),
      textAlign: TextAlign.center,
    );
  }
}
