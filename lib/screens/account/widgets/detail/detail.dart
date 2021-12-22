import 'package:flutter/material.dart';
import 'package:mobile_banking_app/models/account.dart';
import 'package:mobile_banking_app/screens/account/widgets/detail/detail_app_bar.dart';
import 'package:mobile_banking_app/screens/account/widgets/detail/detail_list.dart';

class Detail extends StatefulWidget {

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  int selected = 0;
  final _pageController = PageController();
  final Account account = Account.generateAccount();

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailAppBar(selected, callback(), account),
          Expanded(child: DetailList(selected, callback(), _pageController, account))
        ],
      ),
    );
  }
  
  Function(int index) callback() => (int index) => setState(() => selected = index);

}
