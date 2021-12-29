import 'package:flutter/material.dart';
import 'package:unrelatedapp/models/quiz_result.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<QuizResult> results = [
    QuizResult("Psychological portrait of personality",
        "assets/PsychologyPortrait.png", "Pedantic", "05.12.2021"),
    QuizResult("Tires of relationships", "assets/TiresOfRelationships.png",
        "Friend", "04.12.2021")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: const BoxDecoration(
              color: Color(0xb8bfe4ff),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 50)),
            ),
            child: const Center(
              child: Text(
                "History",
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
        ),
        results.isEmpty ? _emptyHistory() : _histories()
      ],
    ));
  }

  Widget _emptyHistory() {
    return const Center(
        child: Text(
      "Your history is empty",
      style: TextStyle(fontSize: 24, color: Colors.black45),
    ));
  }

  Widget _history(QuizResult quizResult) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          border: Border.fromBorderSide(BorderSide(color: Colors.black45))),
      child: Column(
        children: [
          Text(quizResult.name,
              textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
          Container(
            child: Row(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 18, left: 18),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image(image: AssetImage(quizResult.imgUrl)),
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Result",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        quizResult.result,
                        style: const TextStyle(fontSize: 22),
                      ),
                      Text(
                        quizResult.date,
                        style: const TextStyle(color: Colors.black45),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _histories(){
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 200),
      child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                _history(results[index]),
                SizedBox(height: 15,)
              ]
            );
      }),
    );
  }
}
