import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unrelatedapp/models/quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Quiz> _quizesPopular = [];

  late List<Quiz> _quizesRecommended = [];

  late List<Quiz> _quizesNew = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Quiz quiz1 = Quiz(
        "Know your value",
        "Test data",
        "By Unknown",
        "assets/YourValue.png",
        2,
        null,
    null);
    Quiz quiz2 = Quiz(
        "Tires of relationship",
        "The elements in the formula help you to decide whether someone can be your friend. Reveal the problems in your relationships",
        "By Dr. Jack Schafer",
        "assets/TiresOfRelationships.png",
        0,
        null,
    null);
    Quiz quiz3 =  Quiz(
        "Psychological portrait of personality",
        "Deep analysis of your personality. Plays incredibly high role in choosing future profession. Helps you to understand your emotions, behavior and speech. Determines the reliability of employee, his uniqueness.",
        "By Peter Lindbergh",
        "assets/PsychologyPortrait.png",
        1,
        null,
    null);

    _quizesRecommended.add(quiz1);
    _quizesRecommended.add(quiz2);
    _quizesRecommended.add(quiz3);

    _quizesNew.add(quiz2);
    _quizesNew.add(quiz1);
    _quizesNew.add(quiz3);

    _quizesPopular.add(quiz3);
    _quizesPopular.add(quiz1);
    _quizesPopular.add(quiz2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 32,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchBox(),
                _sectionTitle('Recommended'),
                _recommendedQuizes(_quizesRecommended),
                _sectionTitle('Categories'),
                _categories(),
                _sectionTitle('Popular'),
                _quizes(context,_quizesPopular),
                _sectionTitle('New'),
                _quizes(context,_quizesNew)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: const CupertinoSearchTextField(
      backgroundColor: Colors.white70,
    ),
  );
}

Widget _sectionTitle(String title) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 22),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 54),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}

Widget _recommendedQuiz(Quiz quiz) {
  return SizedBox(
    height: 130,
    width: 100,
    child: Stack(children: [
      Container(
        height: 91,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            color: quiz.getColor(),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12))),
        child: quiz.imgUrl != null
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: AssetImage(quiz.imgUrl!),
                ),
              )
            : null,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 40,
          width: 100,
          child: Center(
            child: Text(
              quiz.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(12))),
        ),
      ),
    ]),
  );
}

Widget _recommendedQuizes(List<Quiz> quizesList) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 26),
    child: Container(
      height: 130,
      child: ListView.builder(
          itemCount: quizesList.length,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(children: [
              _recommendedQuiz(quizesList[index]),
              const SizedBox(width: 10)
            ]);
          }),
    ),
  );
}

Widget _quiz(BuildContext context,Quiz quiz) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed("/quiz_details",arguments: quiz);
    },
    child: SizedBox(
      height: 185,
      width: 150,
      child: Stack(children: [
        Container(
          height: 131,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              color: quiz.getColor(),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12))),
          child:
              quiz.imgUrl != null ? Image(image: AssetImage(quiz.imgUrl!)) : null,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 55,
            width: 150,
            child: Center(
              child: Text(quiz.name, textAlign: TextAlign.center),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(12))),
          ),
        ),
      ]),
    ),
  );
}

Widget _quizes(BuildContext context,List<Quiz> quizesList) {
  return Container(
    height: 185,
    child: ListView.builder(
        itemCount: quizesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
              children: [_quiz(context,quizesList[index]), const SizedBox(width: 10)]);
        }),
  );
}

Widget _categories() {
  return Wrap(
    children: [
      _category('Motivation', FontAwesomeIcons.carrot),
      _category('Self-analysis', FeatherIcons.bookOpen),
      _category('Relationships', FeatherIcons.heart),
      _category('Career', FeatherIcons.briefcase),
    ],
  );
}

Widget _category(String name, IconData icon) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: OutlinedButton.icon(
      onPressed: () => {},
      icon: Icon(icon, color: Colors.black),
      label: Text(
        name,
        style: const TextStyle(color: Colors.black),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      ),
    ),
  );
}
