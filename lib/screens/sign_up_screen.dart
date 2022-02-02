import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          _signUpTitle(),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _username_password_fields("Username", FontAwesomeIcons.user),
                  SizedBox(
                    height: 20,
                  ),
                  _username_password_fields("Email", FeatherIcons.mail),
                  SizedBox(height: 20),
                  _username_password_fields("Password", FeatherIcons.key),
                  SizedBox(
                    height: 120,
                  ),
                  _singUp_button(),
                  SizedBox(
                    height: 0,
                  ),
                  _login_alter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 36)),
        color: Color(0xffF95708),
      ),
      child: Align(
        child: Text(
          "Sign up",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
        alignment: Alignment(0.7, 0.6),
      ),
    );
  }

  Widget _username_password_fields(String text, IconData icon) {
    return Container(
      width: 350,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: EdgeInsets.only(right: 0, left: 30),
          hintText: text,
        ),
      ),
    );
  }

  Widget _singUp_button() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 50),
              primary: Color(0xffF95708),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: Text(
            "SIGN UP",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget _login_alter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Already have an account? "),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Login",
            style: TextStyle(color: Color(0xffF95708)),
          ),
        ),
      ],
    );
  }
}
