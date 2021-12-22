import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';

class Utils {

  static Text formatPrice(double amount, {Color? color, FontWeight weight = FontWeight.bold, double size = 18}) {

    bool isPositive = amount > 0;

    return Text("${isPositive ? "+" : "-"} \$${amount.abs().toStringAsFixed(2)}", style: TextStyle(
        fontWeight: weight,
        fontSize: size,
        color: color ?? (isPositive ? kSecondaryColor : Colors.black)
    ));
  }

}