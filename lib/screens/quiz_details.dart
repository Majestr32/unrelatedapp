import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:unrelatedapp/models/quiz.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class QuizDetails extends StatefulWidget {
  final Quiz? quiz;
  const QuizDetails({Key? key, this.quiz}) : super(key: key);

  @override
  _QuizDetailsState createState() => _QuizDetailsState();
}

class _QuizDetailsState extends State<QuizDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xffB8BFE4),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(height: 30,),
                Text(this.widget.quiz!.name, style: TextStyle(fontFamily: 'SourceSerif4', fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 25,),
                Image(
                  image: AssetImage(this.widget.quiz!.imgUrl!),
                  width: 155,
                  height: 155,),

                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.question),
                    SizedBox(width: 5,),
                    Text(this.widget.quiz!.questions != null ? this.widget.quiz!.questions!.length.toString()+" questions"
                        : "no questions", style: TextStyle(fontWeight: FontWeight.bold)),

                  ],
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(this.widget.quiz!.description, style: TextStyle(fontFamily: 'SourceSerif4')),
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.centerRight, child: Text(this.widget.quiz!.author, style: TextStyle(color: Colors.grey[600]),))

                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushNamed("/slidable_quiz");
                }, child: Text("Start Quiz", style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),), style: ElevatedButton.styleFrom(primary: Color(0xff1954DD), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0) ), minimumSize: Size(190,45))),
                SizedBox(height: 50,),



              ],
            )
          ]
      ),
    );
  }
}