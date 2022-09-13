import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Models/courses.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCourses/components/pencil.dart';
import 'package:flutter_web_1/constant.dart';

class CardEditingCourses extends StatelessWidget {
  final Courses course;

  const CardEditingCourses({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var tipoCurso = course.tipoCurso!;
    var totalAulas = course.totalAulas!;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            "editaraulas",
          );
        },
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
                                  decoration: TextDecoration.none,
                                  fontSize: (size.height + size.width) / 150,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "$totalAulas AULAS".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.none,
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
                            PencilImage(width: (size.height + size.width) / 50)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
