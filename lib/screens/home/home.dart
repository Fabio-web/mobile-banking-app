import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/screens/account/account.dart';
import 'package:mobile_banking_app/screens/home/widgets/catch_phrase.dart';
import 'package:mobile_banking_app/widgets/button_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: MediaQuery.of(context).padding.top),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: Stack(
                        children: [
                          Center(
                            child: ClipRRect(
                              child: Image.asset('assets/images/card2.png'),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CatchPhrase(),
                        Column(
                          children: [
                            ButtonBuilder("Sign up", backgroundColor: kSecondaryColor, onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => AccountPage())
                              );
                            }),
                            SizedBox(height: 15),
                            ButtonBuilder("Log in", backgroundColor: Colors.transparent, color: Colors.black),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
