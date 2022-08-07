import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/web_menu_bar.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_us_text.dart';
import 'package:flutter_web_1/Screens/Welcome/components/benefits/about_benefits.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_student.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_teacher.dart';
import 'package:flutter_web_1/Screens/Welcome/components/benefits/card_benefits.dart';
import 'package:flutter_web_1/Screens/Welcome/components/people_image.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';



class WebWellcomeScreen extends StatelessWidget {
  

  const WebWellcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // menu
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [                  
                 CustomMenuBar(),
          ],
        ),

        // imagem inicial + login e cadastre-se
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



          // beneficios
        
          
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 100, bottom: 50),
            child: Row(
              children: const <Widget>[
                Aboutbenefits()
              ],
            ),
          ),
        
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CardBenefits(image: "assets/images/clock.png", textDescripiton: "Os dias, horários\ne o tempo\nque você precisa.",),
          CardBenefits(image: "assets/images/money.png", textDescripiton: "O preço que encaixa nas\nsuas necessidades e\nescolhas.",),
          CardBenefits(image: "assets/images/idea.png", textDescripiton: "O aprendizado que é\ncentrado exatamente\nno que você precisa.",)
        ],
       ),

        
        // descrição para cada tipo de usuario
        Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Row(
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
                    padding: const EdgeInsets.only(left: 100, right: 100),
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
        ),

      
       // sobre nós
       Padding(
         padding: const EdgeInsets.only(top: 350),
         child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
            Column(
              children: <Widget>[
                PeoplesImage(height: (size.height+size.width)/5, width: (size.height+size.width)/5,)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                children: const <Widget>[
                  AboutUsText()
                ],
              ),
              ],
            )
           ],
         ),
       )
        
      ],
    );
  }
}

