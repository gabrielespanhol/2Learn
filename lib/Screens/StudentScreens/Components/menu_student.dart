import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/constant.dart';

class MenuStudent extends StatelessWidget {
  const MenuStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Suas aulas',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 60,
                  color: KPrimaryColor,
                  fontWeight: FontWeight.bold,
                  //fontFamily:'OpenSans',
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
