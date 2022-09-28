import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

// ignore: must_be_immutable
class DefaultButtonTeacher extends StatelessWidget {
  final String text;
  final Function press;
  double? fontSize;

  DefaultButtonTeacher({
    Key? key,
    required this.text,
    required this.press,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: (size.height + size.width) / 80),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            height: (size.height + size.width) / 40,
            width: (size.height + size.width) / 7,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 217, 217, 217),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                      color: KTextcolorLight,
                      fontSize: fontSize,
                      fontFamily: 'OpenSans-bold',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          onTap: () {
            press();
          },
        ),
      ),
    );
  }
}
