import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:unrelatedapp/screens/history.dart';
import 'package:unrelatedapp/screens/home.dart';
import 'package:unrelatedapp/screens/profile.dart';
import 'package:unrelatedapp/screens/quiz_details.dart';
import 'package:unrelatedapp/screens/sign_up_screen.dart';
import 'package:unrelatedapp/screens/slidable_quiz_screen.dart';
import 'package:unrelatedapp/screens/quiz_result.dart';
import 'package:unrelatedapp/screens/login_screen.dart';

import 'main.dart';
import 'models/quiz.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/sign_up':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/':
        return MaterialPageRoute(builder: (_) => Main());
      case '/quiz_details':
        if (args is Quiz) {
          return MaterialPageRoute(builder: (_) => QuizDetails(quiz: args));
        } else {
          return _errorRoute();
        }
      case '/slidable_quiz':
        return MaterialPageRoute(builder: (_) => SlidableQuizScreen());
      case '/quiz_result':
        return MaterialPageRoute(builder: (_) => QuizResultScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
