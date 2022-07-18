import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double height, width;
  const LogoImage({
    Key? key, required this.height, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
          ),
    );
  }
}