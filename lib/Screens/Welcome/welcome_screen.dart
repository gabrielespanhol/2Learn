import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/Welcome/mobile_welcome_screen.dart';
import 'package:flutter_web_1/Screens/Welcome/web_wellcome_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            mobile: MobileWelcomeScreen(),
            desktop: WebWellcomeScreen(),
          ),
        ),
      ),
    );
  }
}
