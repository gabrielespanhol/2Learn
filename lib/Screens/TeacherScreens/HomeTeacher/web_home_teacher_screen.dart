import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Controlers/helper_function.dart';
import 'package:flutter_web_1/Models/FinalModels/user.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/HomeTeacher/components/default_button.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/personal_informations_editing_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';
import 'package:flutter_web_1/constant.dart';

class WebHomeTeacher extends StatefulWidget {
  const WebHomeTeacher({
    Key? key,
  }) : super(key: key);

  @override
  State<WebHomeTeacher> createState() => _WebHomeTeacherState();
}

class _WebHomeTeacherState extends State<WebHomeTeacher> {
  String userName = "";
  String email = "";
  String userSex = "";
  Users tutor = Users();
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((valueEmail) {
      setState(() {
        email = valueEmail!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((valueName) {
      setState(() {
        userName = valueName!;
      });
    });
    await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserData(FirebaseAuth.instance.currentUser!.uid)
        .then((snapshot) {
      setState(() {
        tutor = snapshot[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var sexo = tutor.userSex;
    if (sexo == "UserSex.M") {
      sexo = "BEM-VINDO";
    } else if (sexo == "UserSex.F") {
      sexo = "BEM-VINDA";
    } else {
      sexo = "BEM-VINDO(a)";
    }
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "${FirebaseAuth.instance.currentUser!.uid}.png",
          textoMenu: "SEJA $sexo DE VOLTA,  $userName",
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
                  text: "Informações Pessoais",
                  press: () async {
                    // Navigator.pushNamed(context, "/informacoesPessoais"),
                    final result1 = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const PersonalInformationsEditing(),
                      ),
                    );
                    setState(() {
                      userName = result1;
                    });
                  },
                ),
                DefaultButtonTeacher(
                  text: "Cadastrar novas aulas",
                  press: () => {
                    Navigator.pushNamed(context, "/CadastrarCurso"),
                  },
                ),
                DefaultButtonTeacher(
                  text: "Aulas Contratadas",
                  press: () => {
                    Navigator.pushNamed(context, "/visualizaraulas"),
                  },
                ),
                DefaultButtonTeacher(
                  text: "Edição de aulas",
                  press: () => {
                    Navigator.pushNamed(context, "/visualizaraulasedicao"),
                  },
                ),
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
