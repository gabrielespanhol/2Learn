import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class MenuItemCuston extends StatelessWidget {
  final String title;
  final String press;
  
  const MenuItemCuston({
     Key? key,   
     required this.title,   
     required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => {
                Navigator.pushNamed(
            context,
            press,
          ),
            },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: KTextcolor.withOpacity(0.3),
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}