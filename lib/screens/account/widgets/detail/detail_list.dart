import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_banking_app/constants/colors.dart';
import 'package:mobile_banking_app/models/account.dart';
import 'package:mobile_banking_app/models/transaction.dart';
import 'package:mobile_banking_app/screens/account/widgets/detail/detail_item.dart';
import 'package:mobile_banking_app/screens/account/widgets/detail/detail_transaction.dart';

class DetailList extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Account account;

  DetailList(this.selected, this.callback, this.pageController, this.account);

  @override
  Widget build(BuildContext context) {
    List<Transaction>? listTransaction = account.transactions[account.transactions.keys.toList()[selected]];
    Map<DateTime, List<Transaction>> listTransactionByDate = {};

    if (listTransaction != null) {
      for (var element in listTransaction) {
        DateTime date = element.date;

        DateTime dateMin = DateTime(date.year, date.month, date.day);
        DateTime dateMax = dateMin.add(Duration(days: 1));

        listTransactionByDate.putIfAbsent(dateMin,
                () => listTransaction.where((e) => e.date.isAfter(dateMin) && e.date.isBefore(dateMax)).toList());
      }
    }

    final listDay = listTransactionByDate.keys.toList();

    return Container(
        padding: EdgeInsets.only(right: 25, left: 25),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) => callback(index),
          children: listDay.map((keyDay) => _buildListTransaction(listTransactionByDate, listDay)).toList(),
        ));
  }

  ListView _buildListTransaction(Map<DateTime, List<Transaction>> listTransactionByDate, List<DateTime> listDay) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 25),
      itemBuilder: (context, index) {
        List<Transaction>? transactions = listTransactionByDate[listDay[index]];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('E, d MMM').format(listDay[index]), style: TextStyle(color: kGrey, fontWeight: FontWeight.w600)),
            if (transactions != null) ..._buildListTransactionItem(context, transactions)
          ],
        );
      },
      itemCount: listDay.length,
      separatorBuilder: (_, index) => SizedBox(height: 25),
    );
  }

  Iterable<GestureDetector> _buildListTransactionItem(BuildContext context, List<Transaction> transactions) {
    return transactions.map((transaction) => GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailTransaction()));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: DetailItem(transactions.firstWhere((element) => element == transaction)),
      )
    ));
  }
}
