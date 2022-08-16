import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  final String text;
  final String press;
  double? fontSize;

  DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
              color: KPrimaryColor, borderRadius: BorderRadius.circular(15)),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                color: KTextcolorLight,
                fontSize: fontSize,
                fontFamily: 'OpenSans-regular',
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            press,
          );
        },
      ),
    );
  }
}
