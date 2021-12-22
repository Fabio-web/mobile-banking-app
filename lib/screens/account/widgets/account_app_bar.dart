import 'package:flutter/material.dart';

class AccountAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/images/profile.png", width: 50, height: 50),
              ),
              SizedBox(width: 20),
              Text("Fabio M.", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ))
            ],
          ),
          Icon(Icons.settings)
        ],
      ),
    );
  }
}
