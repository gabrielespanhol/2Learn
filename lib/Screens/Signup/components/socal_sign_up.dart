import 'package:flutter/material.dart';

import '../../../screens/Signup/components/or_divider.dart';
import '../../../screens/Signup/components/social_icon.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SocalIcon(
              iconSrc: "assets/icons/facebook.svg",
              press: "a",
            ),
            SocalIcon(
              iconSrc: "assets/icons/twitter.svg",
              press: "a",
            ),
            SocalIcon(
              iconSrc: "assets/icons/google-plus.svg",
              press: "a",
            ),
          ],
        ),
      ],
    );
  }
}
