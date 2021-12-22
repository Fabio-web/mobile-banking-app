import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/widgets/button_builder.dart';

class CardProduced extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Stack(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width-60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-1, 1),
                        end: Alignment(1, 0),
                        colors: [kPrimaryColor, kSecondaryColor], // red to yellow
                      ),
                      borderRadius: BorderRadius.circular(26)
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  width: MediaQuery.of(context).size.width-60,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text("Your CapWay card is being produced", style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white
                            )),
                          ),
                          Image.asset("assets/images/card_flat.png", width: 75)
                        ],
                      ),
                      SizedBox(height: 25),
                      ButtonBuilder("Check status", backgroundColor: Colors.white, color: Colors.black, paddingVertical: 10, style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                      ))
                    ],
                  ),
                )
              ]
          )
        ],
      ),
    );
  }
}
