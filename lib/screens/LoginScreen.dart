import 'dart:ui';

import "package:flutter/material.dart";
import "package:roomie_lah/constants.dart";
import "package:roomie_lah/widgets/AppBar.dart";
import "package:roomie_lah/widgets/rounded_button.dart";
import "package:roomie_lah/widgets/rounded_input_field.dart";
import "package:roomie_lah/screens/recommendation_screen.dart";
import "package:roomie_lah/screens/SignupScreen.dart";

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

String enteredUsername = "";
String enteredPassword = "";
bool obscureBool = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  buildPopUp(String title, String body) {
    return AlertDialog(
      title: Text(title),
      content: Column(mainAxisSize: MainAxisSize.min, children: [Text(body)]),
    );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5.0,
        backgroundColor: kPrimaryColor,
        title: Center(
          child: Text(
            'LOGIN',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0,
                fontSize: 23.0),
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03, width: size.width),
              Image.asset(
                "assets/images/RoomieLah_logo.png",
                height: size.height * 0.2,
              ),
              SizedBox(height: size.height * 0.1),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(29),
                  border: Border.all(color: kPrimaryColor),
                ),
                child: TextField(
                  onChanged: (value) {
                    enteredUsername = value;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(29),
                  border: Border.all(color: kPrimaryColor),
                ),
                child: TextField(
                  obscureText: obscureBool,
                  onChanged: (value) {
                    enteredPassword = value;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureBool = !obscureBool;
                        });
                      },
                      icon: Icon(
                        obscureBool ? Icons.visibility : Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    primary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                onPressed: () => {
                  if (enteredUsername == "username" &&
                      enteredPassword == "password")
                    {Navigator.pushNamed(context, RecommendationScreen.id)}
                  else
                    {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => buildPopUp("Error",
                              'Please enter correct username and/or password.'))
                    }
                  // Navigator.pushNamed(context, RecommendationScreen.id)
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: kPrimaryColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                onPressed: () =>
                    {Navigator.pushNamed(context, SignupScreen.id)},
                child: Text(
                  "First time user? Signup here",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
