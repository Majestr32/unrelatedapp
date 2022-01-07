import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:unrelatedapp/screens/history.dart';
import 'package:unrelatedapp/screens/home.dart';
import 'package:unrelatedapp/screens/profile.dart';
import 'package:unrelatedapp/screens/quiz_details.dart';
import 'package:unrelatedapp/screens/slidable_quiz_screen.dart';

import 'models/quiz.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/history':
        return MaterialPageRoute(builder: (_) => HistoryPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/quiz_details':
        if(args is Quiz){
          return MaterialPageRoute(builder: (_) => QuizDetails(quiz: args));
        }
        else {
          return _errorRoute();
        }
      case '/slidable_quiz':
        return MaterialPageRoute(builder: (_) => SlidableQuizScreen());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
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