import '../infrasctructure/PlatformDetection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlaButton extends StatelessWidget {
  final String title;
  final Function onPressHandler;

  AdaptiveFlaButton({this.title, this.onPressHandler});
  @override
  Widget build(BuildContext context) {
    return PlatformDetection.getPlatform() == Platforms.IOS
        ? CupertinoButton(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: onPressHandler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: onPressHandler,
          );
  }
}
