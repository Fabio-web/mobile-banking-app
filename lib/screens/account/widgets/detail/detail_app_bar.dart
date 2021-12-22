import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/models/account.dart';

class DetailAppBar extends StatelessWidget {

  final int selected;
  final Function callback;
  final Account account;

  DetailAppBar(this.selected, this.callback, this.account);

  @override
  Widget build(BuildContext context) {

    final categories = account.transactions.keys.toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => callback(index),
                child: Container(
                  padding: EdgeInsets.only(bottom: 8, left: 2, right: 2),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: selected == index ? kPrimaryColor : Colors.transparent,
                              width: 4
                          )
                      )
                  ),
                  child: Text(categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: selected == index ? Colors.black : kGrey,
                      )
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(width: 25),
          itemCount: categories.length),
    );
  }
}
