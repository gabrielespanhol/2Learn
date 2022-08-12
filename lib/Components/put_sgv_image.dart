import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PutSvgImage extends StatelessWidget {
  final String image;
  final double width;
  const PutSvgImage({
    Key? key,
    required this.width,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              image,
              width: width,
            ),
          ],
        ),
      ],
    );
  }
}
