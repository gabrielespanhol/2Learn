import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_1/constant.dart';

class CardBenefits extends StatelessWidget {
const CardBenefits({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 250,
      height: 600,
      decoration: BoxDecoration(
        color: KTextcolorLight
      ),

      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/clock.svg", width: (size.height+size.width)/20),
            ),
            ],
          )
        ],
      )
    );
  }
}