import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Models/contracted_classes.dart';

import 'package:flutter_web_1/constant.dart';

class CourseCardTeacher extends StatelessWidget {
  final ContractedClasses course;

  const CourseCardTeacher({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var porcentagemCursoAndamento =
        int.parse(course.givenClasses!) / int.parse(course.numbersClasses!);
    var porcentagemCursoAndamentoToString =
        (porcentagemCursoAndamento * 100).round();
    var tipoCurso = course.classesCategory!;
    var totalAulas = course.numbersClasses!;
    var proximoEncontro = "ARUMAR";
    var sexo = course.alunoSex.toString();
    if (sexo == "UserSex.M") {
      sexo = "Aluno: ";
    } else if (sexo == "UserSex.F") {
      sexo = "Aluna: ";
    } else {
      sexo = "Aluno(a): ";
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: (size.height + size.width) / 9,
                    height: (size.height + size.width) / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: KPrimaryGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: (size.height + size.width) / 70,
                            bottom: (size.height + size.width) / 200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              PutSvgImage(
                                image: "assets/icons/$tipoCurso.svg",
                                width: (size.height + size.width) / 25,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: (size.height + size.width) / 200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                course.classesName.toString().toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: (size.height + size.width) / 150,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: (size.height + size.width) / 15,
                                  height: (size.height + size.width) / 120,
                                  child: LinearProgressIndicator(
                                    backgroundColor: KPrimaryColorLight,
                                    value: porcentagemCursoAndamento,
                                    valueColor: const AlwaysStoppedAnimation(
                                        KPrimaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              ("$porcentagemCursoAndamentoToString%"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 150,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              sexo,
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 150,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              course.alunoName.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 150,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "$totalAulas AULAS".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 150,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: (size.height + size.width) / 280),
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: (size.height + size.width) / 160,
                        color: KTextcolorLight,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/aula",
          ),
        },
      ),
    );
  }
}
