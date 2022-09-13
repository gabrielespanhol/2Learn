import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/HomeTeacher/components/default_button.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';
import 'package:flutter_web_1/constant.dart';

class WebHomeTeacher extends StatelessWidget {
  const WebHomeTeacher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "Bella.png",
          textoMenu: "SEJA BEM-VINDA DE VOLTA,  Isabella!",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "O que deseja hoje?",
                    style: TextStyle(
                      color: KTextcolorLight,
                      fontSize: (size.height + size.width) / 150,
                      fontFamily: 'OpenSans-bold',
                    ),
                  ),
                ),
                DefaultButtonTeacher(
                    text: "Informações Pessoais", press: "/homeScreenTeacher"),
                DefaultButtonTeacher(
                    text: "Cadastrar novas aulas", press: "/CadastrarCurso"),
                DefaultButtonTeacher(
                    text: "Aulas Contratadas", press: "/visualizaraulas"),
                DefaultButtonTeacher(
                    text: "Edição de aulas", press: "/visualizaraulasedicao")
              ],
            ),
            Column(
              children: <Widget>[
                LogoImage(
                  width: (size.height + size.width) / 4.5,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
