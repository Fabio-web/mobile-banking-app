import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_banking_app/screens/auth/auth.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Banking Application',
        home: AuthPage(),
        theme: ThemeData(
          fontFamily: 'Gilroy'
        ),
    );
  }
}
