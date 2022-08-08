import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalIconCopyright extends StatelessWidget {
  final String? iconSrc;
  final String press;
  const SocalIconCopyright({
    Key? key,
    this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
                Navigator.pushNamed(
            context,
            press,
          ),
            },
      child:  Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SvgPicture.asset(
            iconSrc!,
            height: (size.height+size.width)/47,
            width: (size.height+size.width)/47,
        ),
      ),
    );
  }
}
