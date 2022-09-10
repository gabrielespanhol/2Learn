import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Models/courses.dart';
import 'package:flutter_web_1/constant.dart';

class CourseCardStudent extends StatelessWidget {
  final Courses course;

  const CourseCardStudent({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var porcentagemCursoAndamento = course.aulaRealizada! / course.totalAulas!;
    var porcentagemCursoAndamentoToString =
        (porcentagemCursoAndamento * 100).round();
    var tipoCurso = course.tipoCurso!;
    var totalAulas = course.totalAulas!;
    var proximoEncontro = course.proximoEncontro!;
    var sexo = course.sexoTutor.toString();
    if (sexo == "M") {
      sexo = "Tutor: ";
    } else if (sexo == "F") {
      sexo = "Tutora: ";
    } else {
      sexo = "Tutur(a): ";
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
                                course.nomeCurso.toString().toUpperCase(),
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
                              course.nomeTutor.toString(),
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
                      'Próximo encontro: $proximoEncontro',
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
      ),
    );
  }
}
