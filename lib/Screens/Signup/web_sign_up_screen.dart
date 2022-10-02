import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/web_menu_bar.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
import 'components/socal_sign_up.dart';

class WebSignUpScreen extends StatefulWidget {
  const WebSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WebSignUpScreen> createState() => _WebSignUpScreenState();
}

class _WebSignUpScreenState extends State<WebSignUpScreen> {
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
              child: SignUpScreenTopImage(),
            ),
            Expanded(
              child: Column(
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
        ),
      ],
    );
  }
}
