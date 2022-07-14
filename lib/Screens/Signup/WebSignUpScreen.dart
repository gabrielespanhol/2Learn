import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Login/components/login_form.dart';
import 'package:flutter_web_1/Screens/Login/components/login_screen_top_image.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
import 'components/socal_sign_up.dart';

class WebSignUpScreen extends StatelessWidget {
  const WebSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: SignUpScreenTopImage() 
        ),
        Expanded(child: Column(
          children: const [
            SizedBox(
              width: 450,
              child: SignUpForm(),
              ),
            SizedBox(
              width: 450,
              child: SocalSignUp(),
            ),
          ],
        ),
        ),
      ],
    );
  }
}

