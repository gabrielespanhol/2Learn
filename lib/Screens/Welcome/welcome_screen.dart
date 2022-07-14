import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/responsive.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

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

class WebWellcomeScreen extends StatelessWidget {
  const WebWellcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: WelcomeImage()),
        Expanded(child: Row(
          children: const [
            SizedBox(
              width: 450,
              child: LoginAndSignupBtn(),
            )
          ],
        ),),
      ],
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WelcomeImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
