import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/WebMenuBar.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_us_student.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_us_teacher.dart';
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
          children: [    
                 LogoImage(height: 90, width: 90),
                 Spacer(),
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
            Expanded(child: Column(
              children: const [
                SizedBox(
                  width: 610,
                  child: LoginAndSignupBtn(),
                )
              ],
            ),
            ),
          ],
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                AboutUsStudent(),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(100),
                  child: Container(
                    width: 3,
                    height: (size.height+size.width)/5,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 216, 215, 215)
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: const [
                AboutUsTeacher(),
              ],
            ),
          ],
        ),
        
      ],
    );
  }
}

