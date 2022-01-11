import 'package:flutter/material.dart';
import 'package:unrelatedapp/models/quiz.dart';
import 'package:unrelatedapp/models/quiz_answer.dart';
import 'package:unrelatedapp/models/quiz_question.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SlidableQuizScreen extends StatefulWidget {
  const SlidableQuizScreen({Key? key}) : super(key: key);

  @override
  _SlidableQuizScreenState createState() => _SlidableQuizScreenState();
}

class _SlidableQuizScreenState extends State<SlidableQuizScreen> {
  late Quiz quiz;
  late List<QuizAnswer> answers1;
  late List<QuizAnswer> answers2;
  late List<QuizAnswer> answers3;
  late List<QuizAnswer> answers4;
  late List<QuizQuestion> questions;
  double _sliderValue = 0;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    answers1 = [
      QuizAnswer("We live far away from each other (another country or city)",
          1, "MAIN"),
      QuizAnswer("We live in the same city, area.", 2, "MAIN"),
      QuizAnswer(
          "We see each other on the same courses, parties or gym.", 3, "MAIN"),
      QuizAnswer(
          "We are in opposite groups in the university/school.", 4, "MAIN"),
      QuizAnswer(
          "We are in the same group in the university/school.", 5, "MAIN"),
      QuizAnswer("We are training/working in the same section.", 6, "MAIN"),
      QuizAnswer("We work in pairs up to 2-4 people.", 7, "MAIN"),
      QuizAnswer("Our houses/flats are neighboring.", 8, "MAIN"),
      QuizAnswer("We are living and dining in the same house/flat.", 9, "MAIN"),
      QuizAnswer("We are living in the same room.", 10, "MAIN"),
    ];
    answers2 = [
      QuizAnswer("Saying good morning, goodbye, thanks.", 1, "MAIN"),
      QuizAnswer("Short talking about nothing.", 2, "MAIN"),
      QuizAnswer("Informative talking about 3 minutes", 3, "MAIN"),
      QuizAnswer("Short explanations about some topics (school/university) or skype/discord meetings", 4, "MAIN"),
      QuizAnswer("Having lunch together.", 5, "MAIN"),
      QuizAnswer("Regular meetings for about 30-60 minutes.", 6, "MAIN"),
      QuizAnswer("Going parties, concerts together.", 7, "MAIN"),
      QuizAnswer("Spending 3-4 hours", 8, "MAIN"),
      QuizAnswer("Travelling, interacting almost all day, except job or another work", 9, "MAIN"),
      QuizAnswer("All day", 10, "MAIN"),
    ];
    answers3 = [
      QuizAnswer("One interaction that won`t happen one more time", 1, "MAIN"),
      QuizAnswer("Once a year or any mobile messaging", 2, "MAIN"),
      QuizAnswer("Every 1-3 months in real life", 3, "MAIN"),
      QuizAnswer("Once in two weeks", 4, "MAIN"),
      QuizAnswer("Once a week", 5, "MAIN"),
      QuizAnswer("2-3 times in a week", 6, "MAIN"),
      QuizAnswer("4 times in a week", 7, "MAIN"),
      QuizAnswer("5 times in a week", 8, "MAIN"),
      QuizAnswer("Almost every day", 9, "MAIN"),
      QuizAnswer("Many times every day", 10, "MAIN"),
    ];
    answers4 = [
      QuizAnswer("I may feel a bit uncomfortable/ hate", 1, "MAIN"),
      QuizAnswer("I don`t mind his presence, no negative emotions", 2, "MAIN"),
      QuizAnswer("Sometimes I even smile", 3, "MAIN"),
      QuizAnswer("This person is pleasant to me", 4, "MAIN"),
      QuizAnswer("I almost regularly smile", 5, "MAIN"),
      QuizAnswer("We are giving five, handshaking, laughing etc…", 6, "MAIN"),
      QuizAnswer("My interest and emotions are high", 7, "MAIN"),
      QuizAnswer("I want to spend every day in my life with him/her", 8, "MAIN"),
      QuizAnswer("I want him to be every second near me", 9, "MAIN"),
      QuizAnswer("I can`t even forget and sleep after this many days", 10, "MAIN"),
    ];
    questions = [
      QuizQuestion("How close you are during interactions?", answers1, ["MAIN"]),
      QuizQuestion("How much time you spend with this person?", answers2, ["MAIN"]),
      QuizQuestion("How much times you meet during interactions?", answers3, ["MAIN"]),
      QuizQuestion("What subjective emotions do you have during meeting?", answers4, ["MAIN"]),
    ];
    quiz = Quiz(
        "Tires of relationship",
        "The elements in the formula help you to decide whether someone can be your friend. Reveal the problems in your relationships",
        "By Dr. Jack Schafer",
        "assets/TiresOfRelationships.png",
        0,
        questions,
        null);
  }

  @override
  Widget build(BuildContext context) {
    return quiz.questions != null ? _quizQuestion(context) : Container();
  }

  Widget _quizQuestion(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(
                quiz.name,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                (_currentQuestionIndex + 1).toString() + "/" + quiz.questions!.length.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              const Icon(
                FontAwesomeIcons.questionCircle,
                size: 46,
                color: Color(0xFFB8BFE4),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  quiz.questions![_currentQuestionIndex].question,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  quiz.questions![_currentQuestionIndex].answers[_sliderValue.toInt()].answer,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 14,
                  activeTickMarkColor: Colors.transparent,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)
                ),
                child: Slider(
                  onChanged: (value){
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  value: _sliderValue,
                  divisions: 9,
                  min: 0,
                  max: 9,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _currentQuestionIndex + 1 >= quiz.questions!.length ?  _finishButton() : _nextButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _nextButton(){
    return ElevatedButton(
      onPressed: () {
        if(_currentQuestionIndex + 1 >= quiz.questions!.length) {
          return;
        }

        setState(() {
          _currentQuestionIndex++;
          _sliderValue = 0;
        });
      },
      child: const Text("Next",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal
        ),),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(250,60),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
          )
      ),
    );
  }
  Widget _finishButton(){
    return ElevatedButton(
      onPressed: () {
        if(_currentQuestionIndex + 1 >= quiz.questions!.length) {
          Navigator.of(context).pushNamed('/quiz_result');
          return;

        }

        setState(() {
          _currentQuestionIndex++;
          _sliderValue = 0;
        });
      },
      child: const Text("Finish",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal
        ),),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(250,60),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
          ),
        primary: Colors.orange
      ),
    );
  }
}
