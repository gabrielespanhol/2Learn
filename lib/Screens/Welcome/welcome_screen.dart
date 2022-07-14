import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/Welcome/MobileWelcomeScreen.dart';
import 'package:flutter_web_1/Screens/Welcome/WebWellcomeScreen.dart';
import 'package:flutter_web_1/responsive.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            mobile: MobileWelcomeScreen(), 
            desktop: WebWellcomeScreen(),),
        ),
      ),
    );
  }
}
