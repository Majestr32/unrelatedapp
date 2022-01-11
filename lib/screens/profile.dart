import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            _firstWidget(),
            SizedBox(height: 20,),
            _secondWidget(),
            Spacer(),
            _thirdWidget(),


          ],
        )
    );
  }

  Widget _firstWidget() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 320,
        decoration: BoxDecoration(
            color: Color(0xffB8BFE4),
            borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200,50))
        ),
        child: Column(
          children: [
            Container(
                child: Image(
                  image: AssetImage("assets/ProfilePhoto.png"),
                  width: 120,
                  height: 120,
                ),
                margin: EdgeInsets.only(top: 32)
            ),
            SizedBox(height: 20),
            Text("Dan Brandon",
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 8,),
            Text("DanBrandon.02", style: TextStyle(fontSize: 18),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.facebook, color: Color(0xff000000),),
                SizedBox(width: 20,),
                Icon(FontAwesomeIcons.telegram, color: Color(0xff000000),),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _secondWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Quizzes ended", style: TextStyle(fontSize: 19),),
          Text("Followers", style: TextStyle(fontSize: 19),),
          Text("Following", style: TextStyle(fontSize: 19),)
        ],


      ),
    );
  }

  Widget _thirdWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: ElevatedButton(
          onPressed: () {  },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(200,50),
              primary: Color(0xffB8BFE4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
              )
          ),
          child: Text("Log out",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal
            ),),
        ),
      ),
    );
  }
}