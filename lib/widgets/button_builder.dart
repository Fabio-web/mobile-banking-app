
import 'package:flutter/material.dart';
import 'package:mobile_banking_app/constants/colors.dart';

class ButtonBuilder extends StatelessWidget {

  final String text;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final TextStyle? style;
  final Color? backgroundColor;
  final Color? color;


  ButtonBuilder(this.text, {
    this.borderRadius,
    this.width,
    this.style,
    this.backgroundColor,
    this.color
  });

  @override
  Widget build(BuildContext context) {

    double widthQuery = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: width ?? widthQuery,
        child: Text(text,
            textAlign: TextAlign.center,
            style: style ?? TextStyle(fontSize: 18, fontWeight: FontWeight.w700)
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? kPrimaryColor,
          primary: color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15),
          )
      ),
    );
  }
}