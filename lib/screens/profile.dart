import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                decoration: BoxDecoration(
                    color: Color.fromARGB(100, 184, 191, 228),
                  borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(150,50))
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
                      fontSize: 26
                    ),)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () {  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200,50),
                    primary: Color.fromARGB(100, 184, 191, 228),
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
            )
          ],
        )
    );
  }

}