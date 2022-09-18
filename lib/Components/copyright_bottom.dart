import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Components/social_icon.dart';

import '../constant.dart';

class CopyRightBottom extends StatelessWidget {
  const CopyRightBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                width: (size.height + size.width) / 2,
                height: 3,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 216, 215, 215)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: (size.height + size.width) / 2,
              child: Text(
                'SIGA-NOS\n',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 60,
                  color: KPrimaryColor,
                  fontWeight: FontWeight.bold,
                  //fontFamily:'OpenSans',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
            width: (size.height + size.width) / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                SocalIconCopyright(
                  iconSrc: "assets/icons/facebook-icon.svg",
                  press: "a",
                ),
                SocalIconCopyright(
                  iconSrc: "assets/icons/twitter-icon.svg",
                  press: "a",
                ),
                SocalIconCopyright(
                  iconSrc: "assets/icons/linkedin-icon.svg",
                  press: "a",
                ),
                SocalIconCopyright(
                  iconSrc: "assets/icons/youtube-icon.svg",
                  press: "a",
                ),
                SocalIconCopyright(
                  iconSrc: "assets/icons/instagram-icon.svg",
                  press: "a",
                ),
              ],
            )),
        SizedBox(
          width: (size.height + size.width) / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              LogoImage(width: (size.height + size.width) / 25),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Text('© 2Learn, all rights reserved\n',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 150,
                  color: KTextcolor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ))
          ],
        )
      ],
    );
  }
}
