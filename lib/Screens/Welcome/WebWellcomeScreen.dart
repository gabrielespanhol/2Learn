import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/WebMenuBar.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';



class WebWellcomeScreen extends StatelessWidget {
  

  const WebWellcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const[
             CustomMenuBar(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
          height: size.height/1.2,
        ),
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
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
          height: size.height/1.2,
        ),
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
        ),
         Row(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
          height: size.height/1.2,
        ),
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
        ),
      ],
    );
  }
}

