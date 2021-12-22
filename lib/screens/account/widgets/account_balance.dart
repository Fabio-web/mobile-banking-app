import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';

class AccountBalance extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Account balance", style: TextStyle(color: kGrey, fontSize: 18), textAlign: TextAlign.left),
              Text("\$2,707.42", style: TextStyle(
                  fontSize: 48, fontWeight: FontWeight.bold
              ), textAlign: TextAlign.left)
            ],
          ),
        ],
      ),
    );
  }
}
