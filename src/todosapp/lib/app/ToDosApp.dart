import 'package:flutter/material.dart';
import 'package:todosapp/app/screens/screens.dart';

class ToDosApp extends StatelessWidget {
  const ToDosApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, brightness: Brightness.dark),
      home: Scaffold(
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
