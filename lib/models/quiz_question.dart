
import 'package:unrelatedapp/models/quiz_answer.dart';

class QuizQuestion{
  String question;
  List<QuizAnswer> answers;
  List<String> keys;

  QuizQuestion(this.question, this.answers, this.keys);
}