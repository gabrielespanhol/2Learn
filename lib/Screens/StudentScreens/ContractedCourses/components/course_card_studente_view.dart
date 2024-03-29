import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Models/contracted_classes.dart';

import 'package:flutter_web_1/constant.dart';

class CourseCardStudent extends StatelessWidget {
  final ContractedClasses course;

  const CourseCardStudent({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var porcentagemCursoAndamento =
        int.parse(course.givenClasses!) / int.parse(course.numbersClasses!);
    var porcentagemCursoAndamentoToString =
        (porcentagemCursoAndamento * 100).round();
    var tipoCurso = course.classesCategory!;
    var totalAulas = course.numbersClasses!;
    var proximoEncontro =
        "${course.meetings![int.parse(course.givenClasses!)].toDate().day}/${course.meetings![0].toDate().month}/${course.meetings![0].toDate().year}";

    var sexo = course.tutorSex.toString();
    if (sexo == "UserSex.M") {
      sexo = "Tutor: ";
    } else if (sexo == "UserSex.F") {
      sexo = "Tutora: ";
    } else {
      sexo = "Tutor(a): ";
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
                              SizedBox(
                                width: (size.height + size.width) / 15,
                                height: (size.height + size.width) / 70,
                                child: Text(
                                  course.classesName.toString().toUpperCase(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: (size.height + size.width) / 150,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              course.tutorName.toString(),
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
                      'Dia do proximo encontro: $proximoEncontro',
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
            arguments: course.classesName.toString(),
          ),
        },
      ),
    );
  }
}
