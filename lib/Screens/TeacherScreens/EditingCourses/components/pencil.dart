import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PencilImage extends StatelessWidget {
  final double width;
  const PencilImage({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/pencil.svg",
          width: width,
        ),
      ],
    );
  }
}
