import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/background.dart';
import 'package:flutter_web_1/Screens/Signup/mobile_sign_up_screen.dart';
import 'package:flutter_web_1/Screens/Signup/web_sign_up_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileSignUpScreen(),
          desktop: WebSignUpScreen(),
        ),
      ),
    );
  }
}
