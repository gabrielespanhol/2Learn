import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/web_menu_bar.dart';
import 'package:flutter_web_1/Screens/Signup/components/socal_sign_up.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomMenuBar(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 1.2,
            ),
            const Expanded(
              child: LoginScreenTopImage(),
            ),
            Expanded(
              child: Column(
                children: const [
                  SizedBox(
                    width: 450,
                    child: LoginForm(),
                  ),
                  SizedBox(
                    width: 450,
                    child: SocalSignUp(),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
