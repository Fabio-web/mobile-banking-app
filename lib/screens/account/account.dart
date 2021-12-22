import 'package:flutter/material.dart';
import 'package:mobile_banking_app/screens/account/widgets/account_app_bar.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/screens/account/widgets/account_balance.dart';
import 'package:mobile_banking_app/screens/account/widgets/card_produced.dart';


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
            AccountBalance(),
            SizedBox(height: 35),
            CardProduced(),
            SizedBox(height: 35),

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
