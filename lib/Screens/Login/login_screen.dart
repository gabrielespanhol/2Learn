import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/Login/MobileLoginScreen.dart';
import 'package:flutter_web_1/Screens/Login/WebLoginScreen.dart';
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


