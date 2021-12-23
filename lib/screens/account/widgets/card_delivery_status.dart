import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/widgets/button_builder.dart';
import 'package:mobile_banking_app/widgets/modal_bottom_sheet_builder.dart';

class CardDeliveryStatus extends StatelessWidget {

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
                      ), onPressed: () => _onPressedStatus(context))
                    ],
                  ),
                )
              ]
          )
        ],
      ),
    );
  }
  
  void _onPressedStatus(context) {
    
    ModalBottomSheetBuilder(
      context: context,
      hapticFeedback: true,
      children: [
        Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Delivery status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              RichText(text: TextSpan(
                  text: "Order ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(text: "#20169", style: TextStyle(color: kPrimaryColor))
                  ]
              )),
              SizedBox(height: 50),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    backgroundColor: kGrey.withOpacity(0.4),
                    minHeight: 8,
                    value: 0.7,
                    valueColor: AlwaysStoppedAnimation(kSecondaryColor),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconProgressBar(Icons.local_shipping, "Pick up"),
                    _buildIconProgressBar(null, "Shipping..."),
                    _buildIconProgressBar(CupertinoIcons.cube_box, "Delivered")
                  ],
                ),
              )
            ],
          ),
        )
      ]
    );
    
  }

  Column _buildIconProgressBar(IconData? icon, String text) {
    return Column(
      children: [
        icon != null ? Icon(icon, size: 20) : SizedBox(height: 20),
        SizedBox(height: 8),
        Text(text, style: TextStyle(
          fontSize: 12,
          fontWeight: icon == null ? FontWeight.bold : FontWeight.w600
        ))
      ],
    );
  }
}
