import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/web_menu_bar.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Screens/Welcome/components/benefits/about_benefits.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_student.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_teacher.dart';
import 'package:flutter_web_1/Screens/Welcome/components/benefits/card_benefits.dart';
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
          children: const [    
                 LogoImage(height: 100, width: 100),
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
                AboutStudent(),
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
                AboutTeacher(),
              ],
            ),
          ],
        ),

        Container(
          padding: const EdgeInsets.only(top: 10, left: 100),
          child: Column(
            children: [
              Row(
                children: const <Widget>[
                  Aboutbenefits()
                ],
              ),
               Row(             
                children: const <Widget>[
                  Aboutbenefits2()
                ],
              ),
            ],
          ),
        ),

       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CardBenefits(image: "assets/icons/clock.svg", textDescripiton: "Os dias, horários\n       e o tempo\nque você precisa.",),
          CardBenefits(image: "assets/icons/money.svg", textDescripiton: "Os dias, horários\n       e o tempo\nque você precisa.",),
          CardBenefits(image: "assets/icons/idea.svg", textDescripiton: "Os dias, horários\n       e o tempo\nque você precisa.",)
        ],
       )
        
      ],
    );
  }
}

