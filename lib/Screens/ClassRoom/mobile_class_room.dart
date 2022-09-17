import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class MobileClassRoom extends StatelessWidget {
  const MobileClassRoom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'TELA EM CONSTRUÇÂO',
            style: TextStyle(
              fontSize: (size.height + size.width) / 50,
              color: KPrimaryColor,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ],
    );
  }
}
