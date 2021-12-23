import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';

class ModalBottomSheetBuilder {

  final bool hapticFeedback;
  final List<Widget> children;
  BuildContext context;

  ModalBottomSheetBuilder({required this.context, this.hapticFeedback = false, required this.children}) {
    build(context);
  }

  void build(BuildContext context) {

    if(hapticFeedback) HapticFeedback.vibrate();

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          ),
        ),
        context: context,
        builder: (context) => Wrap(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 7),
                width: 50, height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: kGrey.withOpacity(0.4),
                ),
              ),
            ),
            ...children
          ],
        )
    );
  }
}
