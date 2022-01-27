import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          _loginTitle(),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //_userName_password_fields(),
                  _textFields("Username", FeatherIcons.mail, Colors.black87),
                  SizedBox(
                    height: 20,
                  ),
                  _textFields("Password", FeatherIcons.key, Colors.black87),
                  SizedBox(
                    height: 25,
                  ),
                  _forgotPassowrdButton(),
                  SizedBox(
                    height: 50,
                  ),
                  _social_login(),
                  SizedBox(
                    height: 40,
                  ),
                  _signInButton(),
                  _signUp_alter(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(200, 36)),
          color: Color(0xffF95708)),
      child: Align(
        child: Text(
          "Login",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
        alignment: Alignment(0.7, 0.6),
      ),
    );
  }

  Widget _userName_password_fields() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Username",
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "PassWord",
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFields(String text, IconData icon, Color _color) {
    return Container(
      width: 350,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: _color,
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

  Widget _forgotPassowrdButton() {
    return Align(
      child: Text(
        "Forgot Password?",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      ),
      alignment: Alignment(0.7, 0),
    );
  }

  Widget _social_login() {
    return Container(
      child: Column(
        children: [
          Text(
            "Login with:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.facebook,
                size: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FontAwesomeIcons.google,
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
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
            "LOGIN",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget _signUp_alter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Don't have an account? "),
        InkWell(
          onTap: () {
            print("Clinked");
          },
          child: Text(
            "Register",
            style: TextStyle(color: Color(0xffF95708)),
          ),
        ),
      ],
    );
  }
}
