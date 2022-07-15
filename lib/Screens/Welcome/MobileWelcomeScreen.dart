import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_us_student.dart';
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
          height: size.height/4.5,
        ),
        const WelcomeImage(),
        const SizedBox(
          height: 30,
        ),
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
