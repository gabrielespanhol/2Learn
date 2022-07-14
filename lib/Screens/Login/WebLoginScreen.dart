import 'package:flutter/material.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: LoginScreenTopImage() 
        ),
        Expanded(child: Row(
          children: const [
            SizedBox(
              width: 450,
              child: LoginForm(),
              ),
          ],
        ),
        ),
      ],
    );
  }
}