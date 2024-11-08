import 'package:flutter/material.dart';

class AppNavigator {
  static push({context, screen}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushReplacement({context, screen}) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushAndRemoveUntil({context, screen}) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (Route<dynamic> route) => false,
    );
  }
}
