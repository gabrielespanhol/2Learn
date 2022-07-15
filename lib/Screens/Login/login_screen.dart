import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Components/backgroundCenter.dart';
import 'package:flutter_web_1/Screens/Login/mobileLoginScreen.dart';
import 'package:flutter_web_1/Screens/Login/webLoginScreen.dart';
import 'package:flutter_web_1/responsive.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(), 
          desktop: WebLoginScreen(),
          ),
      ),
    );
  }
}


