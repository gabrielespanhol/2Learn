import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_1/Components/web_menu_bar.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_us_text.dart';
import 'package:flutter_web_1/Screens/Welcome/components/benefits/about_benefits.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_student.dart';
import 'package:flutter_web_1/Screens/Welcome/components/about_teacher.dart';
import 'package:flutter_web_1/Screens/Welcome/components/benefits/card_benefits.dart';
import 'package:flutter_web_1/Screens/Welcome/components/people_image.dart';
import 'package:flutter_web_1/constant.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CardBenefits(image: "assets/images/alarme.png", textDescripiton: "Os dias, horários\ne o tempo\nque você precisa.",),
          CardBenefits(image: "assets/images/dinheiro2.png", textDescripiton: "O preço que encaixa nas\nsuas necessidades e\nescolhas.",),
          CardBenefits(image: "assets/images/idea.png", textDescripiton: "O aprendizado que é\ncentrado exatamente\nno que você precisa.",)
        ],
       ),

        
        // descrição para cada tipo de usuario
        Padding(
          padding: const EdgeInsets.only(top: 350, bottom: 150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  AboutStudent(),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset("assets/icons/teacheStudent.svg", width: (size.height+size.width)/7,),
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

      
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //    children: [
                //      Container(
                //           width: (size.height+size.width)/2,
                //           height: 3,
                //           decoration: const BoxDecoration(
                //             color: KPrimaryColor
                //           ),
                //         ),
                //    ],
                //  ),
                
      
       // sobre nós
       Padding(
         padding: const EdgeInsets.only(top: 150 , bottom: 150),
         child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
            Column(
              children: <Widget>[
                LogoImage(width: (size.height+size.width)/4)
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

