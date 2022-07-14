import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/responsive.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
import 'components/socal_sign_up.dart';

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

class WebSignUpScreen extends StatelessWidget {
  const WebSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: SignUpScreenTopImage(),
        ),
        Expanded(
          child: Column(
            children: const [
              SizedBox(
                width: 450,
                child: SignUpForm(),
                
            ),
          SizedBox(
            width: 450,
            child: SocalSignUp()),
          ],
        ),
        ),
      ],
    );
  }
}

class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        const SocalSignUp()
      ],
    );
  }
}
