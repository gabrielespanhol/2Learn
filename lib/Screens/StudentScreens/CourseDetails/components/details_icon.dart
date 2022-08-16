import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class DetailsIcon extends StatelessWidget {
  final String image, text;
  const DetailsIcon({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: (size.height + size.width) / 40,
          height: (size.height + size.width) / 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: (size.height + size.width) / 140,
            color: KTextcolor,
            fontFamily: 'OpenSans',
          ),
        )
      ],
    );
  }
}
