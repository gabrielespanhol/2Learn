import 'package:flutter/material.dart';

class PeopleImage extends StatelessWidget {
  final double height, width;
  const PeopleImage({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pessoas2.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
