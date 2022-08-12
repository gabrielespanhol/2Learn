import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Signup/components/socal_sign_up.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
        const SocalSignUp(),
      ],
    );
  }
}
