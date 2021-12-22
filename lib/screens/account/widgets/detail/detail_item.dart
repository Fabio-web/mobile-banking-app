import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/models/transaction.dart';
import 'package:mobile_banking_app/utils.dart';

class DetailItem extends StatelessWidget {

  final Transaction transaction;

  DetailItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(transaction.logoUrl),
              ),
              SizedBox(width: 25),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 5),
                    Text(transaction.type.name, style: TextStyle(fontSize: 12, color: kdGrey))
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Utils.formatPrice(transaction.amount),
                    SizedBox(height: 5),
                    Text(DateFormat('h:mm a').format(transaction.date), style: TextStyle(fontSize: 12, color: kdGrey))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }


}
