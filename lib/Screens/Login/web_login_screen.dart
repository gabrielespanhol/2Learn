import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/web_menu_bar.dart';
import 'package:flutter_web_1/Screens/Signup/components/socal_sign_up.dart';
import 'package:flutter_web_1/constant.dart';
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
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Text(
                      'É bom te ver novamente!',
                      style: TextStyle(
                        fontSize: (size.height + size.width) / 90,
                        color: KTextcolorLight,
                        // fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: (size.height + size.width) / 40,
                    ),
                    const SizedBox(
                      width: 450,
                      child: LoginForm(),
                    ),
                    const SizedBox(
                      width: 450,
                      child: SocalSignUp(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
