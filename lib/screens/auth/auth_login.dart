import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/screens/account/account.dart';
import 'package:mobile_banking_app/widgets/button_builder.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  _AuthLoginPageState createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      body: Container(

        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+25, right: 30, left: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(CupertinoIcons.arrow_turn_up_left , size: 50)],
                    ),
                  ),
                  SizedBox(height: 50),
                  Text("Let's sign you in.", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Welcome back.\n You've been missed!", style: TextStyle(fontSize: 35)),
                  SizedBox(height: 60),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Phone, email or username',
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(width: 5),
                      Text("Register", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 25),
                  ButtonBuilder("Log in", backgroundColor: kPrimaryColor, color: Colors.white, onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AccountPage())
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

