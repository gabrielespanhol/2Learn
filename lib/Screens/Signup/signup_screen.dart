import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/Signup/MobileSignUpScreen.dart';
import 'package:flutter_web_1/Screens/Signup/WebSignUpScreen.dart';
import 'package:flutter_web_1/responsive.dart';


class SignUpScreen extends StatelessWidget {
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

