import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/Login/mobile_login_screen.dart';
import 'package:flutter_web_1/Screens/Login/web_login_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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


