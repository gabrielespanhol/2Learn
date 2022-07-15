import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final String press;


  const DefaultButton({
    Key? key, required this.text, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      decoration: BoxDecoration(
        color: KPrimaryColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextButton(
         onPressed: () => {
                Navigator.pushNamed(
            context,
            press,
          ),
        },
        child: Text(text.toUpperCase(),
        style: const TextStyle(
                        color: KTextButtoncolor,
                        fontWeight: FontWeight.bold
      ),
      ),
    ),)
    ;
  }
}

