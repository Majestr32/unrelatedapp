import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  _QuizResultScreenState createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _firstWidget(),
          SizedBox(height: 25,),
          _secondWidget(),
          SizedBox(height: 20,),
          _thirdWidget(),
          SizedBox(height: 20,),
          _fourthWidget(),
          Spacer(),
          _buttonWidget(),
          SizedBox(height: 50,)
        ],
      ),


    );
  }

  Widget _firstWidget(){
    return Container(
      height: 175,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 36)),color: Color(0xFFF89D9D)
      ),
      child: Stack(children:[Align(child: Text("Tires of relationship",style: TextStyle(fontSize: 28),),alignment: Alignment(0,0.5)),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
            child: Column(
              children: [
                Icon(FontAwesomeIcons.shareAlt, color: Color(0xFF1954DD), size: 31,),
                Text("Share", style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        )]),


    );
  }

  Widget _secondWidget(){
    return Container(
      child: Align(child: Text("Animated Image", style: TextStyle(color: Color(0xFFFF0000), fontSize: 25),), alignment: Alignment(0,0.0),),
      height: 200,
      width: 375,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xFF707070)),
        borderRadius: BorderRadius.all(Radius.circular(20)),

      ),

    );
  }

  Widget _thirdWidget(){
    return Container(
      child: Column(
        children: [
          Align(child: Text("Result: ", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),alignment: Alignment(-0.44,0.0),),
          Text("Acquaintance", style: TextStyle(fontSize: 38,),)
        ],
      ),
    );
  }

  Widget _fourthWidget(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 50),
        child: Text("Most of people overestimate their relationships", style: TextStyle(fontSize: 20),),
      ),
    );
  }

  Widget _buttonWidget(){
    return Container(
      child: ElevatedButton(onPressed: (){}, child: Text("Okay", style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),), style: ElevatedButton.styleFrom(primary: Color(0xFFFBBF48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0) ), minimumSize: Size(260,50))),
    );
  }
}

