import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
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
            SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _bioWidget(),
                    SizedBox(height: 25,),
                    Align(child: Text("Traits", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),), alignment: Alignment(-0.8,0),),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _traitsWidget(FontAwesomeIcons.heart,Color(0xff9F0000), Color(0xff5772FF), 'Emotions', 150),
                        SizedBox(width: 10,),
                        _traitsWidget(FontAwesomeIcons.crown,Color(0xffE79900), Color(0xffFFC044), 'Leader',200),
                        SizedBox(width: 10,),
                        _traitsWidget(FeatherIcons.messageCircle,Color(0xff0B29C5), Color(0xff5772FF), 'Social',169),
                        SizedBox(width: 10,),
                        _traitsWidget(FontAwesomeIcons.paintBrush,Color(0xff127AA1), Color(0xffFFC044), 'Creative',200),
                        SizedBox(width: 10,),
                        _traitsWidget(FontAwesomeIcons.bookOpen,Color(0xffF2BD56), Color(0xff5772FF), 'Open',179),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Align(child: Text("Social", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),), alignment: Alignment(-0.8,0),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialWidget(FontAwesomeIcons.telegram, Color(0xff353E6B), 50),
                        SizedBox(width: 5,),
                        _socialWidget(FontAwesomeIcons.facebookSquare, Color(0xff353E6B), 50),
                        SizedBox(width: 5,),
                        _socialWidget(FontAwesomeIcons.instagram, Color(0xff353E6B), 50),
                        SizedBox(width: 5,),
                        _socialWidget(FontAwesomeIcons.viber, Color(0xff353E6B), 50),
                      ],
                    ),

                    SizedBox(height: 30,),
                    _thirdWidget(),
                  ],
                ),
              ),
            ),
            //Spacer(),



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
          //Text("Quizzes ended", style: TextStyle(fontSize: 19),),
          //Text("Followers", style: TextStyle(fontSize: 19),),
          //ext("Following", style: TextStyle(fontSize: 19),)
        ],


      ),
    );
  }

  Widget _bioWidget() {
    return Column(
      children: [
        Align(child: Text("Bio", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600 ),), alignment: Alignment(-0.8,0),),
        Align(child: Text("Dan Brandon 23 y.o\nArtist from London Huvardson`s\nuniversity.\nPunk,jazz and music lover.",style: TextStyle(fontSize: 18),), alignment: Alignment(-0.5,0),)

           ],
          );
  }

  Widget _traitsWidget(IconData icon,Color iconColor, Color _color, String text, double containerHeight) {
    return Column(

           children: [
             Container(
               height: containerHeight,
               width: 30,
               color: _color,
             ),
             //Icon(icon),
             Icon(
               icon, color: iconColor,
             ),
             Text(text),
           ],
         );
  }

  Widget _socialWidget(IconData icon, Color iconColor, double iconSize) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: iconSize,)
      ],
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
              primary: Color(0xff5772FF),
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