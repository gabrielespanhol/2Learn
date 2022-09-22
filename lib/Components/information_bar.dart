import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/constant.dart';

class InformationBar extends StatelessWidget {
  final String title;
  const InformationBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: (size.height + size.width) / 60,
                  color: KPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans-bold',
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              PutSvgImage(
                image: "assets/icons/logonImage.svg",
                width: (size.height + size.width) / 60,
              )
            ],
          )
        ],
      ),
    );
  }
}
