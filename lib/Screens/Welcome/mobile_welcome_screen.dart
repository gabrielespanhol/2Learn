import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_student.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_teacher.dart';
import 'package:flutter_web_1/Screens/Welcome/components/login_signup_btn.dart';
import 'package:flutter_web_1/Screens/Welcome/components/welcome_image.dart';

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: size.height / 4.5,
        ),
        const WelcomeImage(),
        const SizedBox(
          height: 0,
        ),
        Row(
          children: const [
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: AboutStudent(),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: AboutTeacher(),
            )
          ],
        ),
      ],
    );
  }
}
