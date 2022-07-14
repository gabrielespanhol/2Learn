import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;


  const DefaultButton({
    Key? key, required this.text, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      decoration: BoxDecoration(
        color: KPrimaryColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextButton(
        onPressed: press(), 
        child: Text(text.toUpperCase(),
      ),
      ),
    );
  }
}

