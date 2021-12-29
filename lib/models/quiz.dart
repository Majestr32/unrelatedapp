import 'package:flutter/material.dart';
import 'package:unrelatedapp/models/quiz_question.dart';
import 'package:unrelatedapp/models/quiz_result_table_row.dart';

class Quiz{
  String name;
  String description;
  String? imgUrl;
  String author;
  int backgroundColor;
  List<QuizQuestion>? questions;
  List<QuizResultTableRow>? resultsTable;

  Color getColor(){
    Color color = Colors.black;
    switch(backgroundColor){
      case 0:
        color = Color(0xFF372C28);
        break;
      case 1:
        color = Color(0xFFDCBD66);
        break;
      case 2:
        color = Color(0xFF68D1CE);
    }
    return color;
  }

  Quiz(this.name, this.description, this.author, this.imgUrl, this.backgroundColor,
      this.questions, this.resultsTable);
}