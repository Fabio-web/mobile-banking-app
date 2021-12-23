import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/models/transaction.dart';
import 'package:mobile_banking_app/utils.dart';
import 'package:mobile_banking_app/widgets/modal_bottom_sheet_builder.dart';

class DetailItem extends StatelessWidget {

  final Transaction transaction;

  DetailItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _onItemLongPressed(context),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
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
      ),
    );
  }

  void _onItemLongPressed(BuildContext context) {
    ModalBottomSheetBuilder(
      context: context,
      hapticFeedback: true,
      children: [
        Container(
          padding: EdgeInsets.only(left: 25, right: 25, top: 50),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Image.asset(transaction.logoUrl, width: 100),
              ),
              SizedBox(height: 20),

              Text(transaction.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 5),
              Text(transaction.type.name, style: TextStyle(fontSize: 16, color: kdGrey)),

              SizedBox(height: 30),
              Utils.formatPrice(transaction.amount, size: 35),
              SizedBox(height: 5),
              Text(DateFormat('h:mm a').format(transaction.date), style: TextStyle(fontSize: 16, color: kdGrey)),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildItemBottomSheet(Icons.receipt_long, "Bank\nstatement"),
                  _buildItemBottomSheet(Icons.alt_route, "Split\npayment"),
                ],
              ),
              SizedBox(height: 50),

            ],
          ),
        )
      ]
    );
  }

  Column _buildItemBottomSheet(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: kPrimaryColor, size: 35),
        SizedBox(height: 10),
        Text(text, style: TextStyle(fontWeight: FontWeight.w700, color: kPrimaryColor), textAlign: TextAlign.center)
      ],
    );
  }


}
