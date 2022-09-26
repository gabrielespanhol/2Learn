import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/components/details_icon.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/components/request_course_botton.dart';
import 'package:flutter_web_1/constant.dart';

import '../Components/menu_student_search.dart';

// ignore: must_be_immutable
class WebCourseDetails extends StatelessWidget {
  Classes classes = Classes();
  WebCourseDetails({
    Key? key,
    required this.classes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var caminhoFoto = classes.profilePicTeacher;
    var valorCurso = classes.valueClasses.toString();
    var numeroAulas = classes.numberClasses.toString();
    var tempoAula = classes.durationClasses.toString();

    return Column(
      children: [
        MenuStudentSearch(
          title: classes.category.toString(),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: (size.height + size.width) / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: (size.height + size.width) / 20,
                    height: (size.height + size.width) / 64,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(
                          (size.height + size.width) / 100),
                    ),
                    child: Center(
                      child: Text(
                        'Tutor'.toUpperCase(),
                        style: TextStyle(
                          fontSize: (size.height + size.width) / 100,
                          color: KTextcolorLight,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans-bold',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: (size.height + size.width) / 20,
                    height: (size.height + size.width) / 64,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(
                          (size.height + size.width) / 100),
                    ),
                    child: Center(
                      child: Text(
                        'Aulas'.toUpperCase(),
                        style: TextStyle(
                          fontSize: (size.height + size.width) / 100,
                          color: KTextcolorLight,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans-bold',
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: (size.height + size.width) / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: (size.height + size.width) / 15,
                      width: (size.height + size.width) / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/tutores/$caminhoFoto.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          classes.tutorName.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                        Text(
                          classes.tutorName.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      " classes..toString(),",
                      style: TextStyle(
                        fontSize: (size.height + size.width) / 140,
                        color: KTextcolor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-regular',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Formação: ",
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                        Text(
                          "teachers.formacaoAcademica.toString()",
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: (size.height + size.width) / 6,
                          child: Text(
                            textAlign: TextAlign.justify,
                            "teachers.descricaoTutor.toString()",
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 140,
                              color: KTextcolor,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // risco do meio

              Container(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 1500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 185, 184, 184),
                ),
              ),

              // outra parta da descrição

              SizedBox(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "teachers.nomeCurso.toString()",
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: (size.height + size.width) / 4,
                          child: Text(
                            textAlign: TextAlign.justify,
                            classes.description.toString(),
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 140,
                              color: KTextcolor,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    ),

                    // container cinsa com o numero de aula, valor da aula etc
                    Row(
                      children: <Widget>[
                        Container(
                          height: (size.height + size.width) / 13,
                          width: (size.height + size.width) / 4,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  DetailsIcon(
                                      image: "assets/images/book.png",
                                      text:
                                          "$numeroAulas Aulas                 "),
                                  DetailsIcon(
                                      image: "assets/images/money.png",
                                      text: "R\$ $valorCurso (Completo)"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  const DetailsIcon(
                                      image: "assets/images/idea.png",
                                      text: "Conteúdos adicionais         "),
                                  DetailsIcon(
                                      image: "assets/images/clock.png",
                                      text:
                                          "$tempoAula min - Horário à combinar"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // logo + botão de solicitar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const RequestCourseBotton(),
                        LogoImage(width: (size.height + size.width) / 25),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
