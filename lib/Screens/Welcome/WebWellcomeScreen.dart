import 'package:flutter/material.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';


class WebWellcomeScreen extends StatelessWidget {
  const WebWellcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: WelcomeImage()),
        Expanded(child: Row(
          children: const [
            SizedBox(
              width: 450,
              child: LoginAndSignupBtn(),
            )
          ],
        ),),
      ],
    );
  }
}

