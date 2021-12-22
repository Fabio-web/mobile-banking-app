import 'package:flutter/material.dart';
import 'package:mobile_banking_app/screens/account/widgets/account_app_bar.dart';
import 'package:mobile_banking_app/constants/colors.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+25),
        child: Column(
          children: [
            AccountAppBar(),
            SizedBox(height: 35),
            Container(
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
            ),
            SizedBox(height: 35),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width-60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-1, 1),
                        end: Alignment(1, 0),
                        colors: [kPrimaryColor, kSecondaryColor], // red to yellow
                      ),
                      borderRadius: BorderRadius.circular(26)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(
              width: 1, color: kGrey.withOpacity(0.3)
            ))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItemAppBar(icon: Icons.credit_card, text: "Account", active: true),
              _buildItemAppBar(icon: Icons.school, text: "Learn"),
              _buildItemAppBar(icon: Icons.person, text: "Profile"),
              _buildItemAppBar(icon: Icons.more_horiz, text: "More"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemAppBar({required IconData icon, required String text, Function()? onTap, bool active = false}) {

    Color color = active ? kPrimaryColor : kdGrey;

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          SizedBox(height: 10),
          Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
