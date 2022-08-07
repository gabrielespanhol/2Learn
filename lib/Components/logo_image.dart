import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoImage  extends StatelessWidget {
  final double width;
  const LogoImage ({
    Key? key, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/logo.svg", width: width,),   
          ],
        ),   
      ],
    );
  }
}