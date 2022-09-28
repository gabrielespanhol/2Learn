import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Models/teachers.dart';
import 'package:flutter_web_1/constant.dart';

// ignore: must_be_immutable
class CourseCardView extends StatelessWidget {
  final Classes classes;
  String? category;
  Color? color;

  CourseCardView({Key? key, required this.classes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var caminhoFoto = classes.profilePicTeacher;
    var valorCurso = classes.valueClasses;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          width: (size.height + size.width) / 4.5,
          height: (size.height + size.width) / 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: KPrimaryGrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: (size.height + size.width) / 100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: (size.height + size.width) / 22,
                          width: (size.height + size.width) / 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/tutores/$caminhoFoto.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          classes.tutorName.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 130,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: (size.height + size.width) / 80,
                    top: (size.height + size.width) / 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: (size.height + size.width) / 9.4,
                          height: (size.height + size.width) / 40,
                          child: Text(
                            classes.className.toString().toUpperCase(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 120,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans-bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: (size.height + size.width) / 63,
                          width: (size.height + size.width) / 9.4,
                          child: Text(
                            classes.shortDescription.toString().toUpperCase(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 230,
                              color: const Color.fromARGB(255, 217, 217, 217),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans-regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: (size.height + size.width) / 9.4,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: (size.height + size.width) / 82,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "R\$  $valorCurso",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: (size.height + size.width) / 130,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans-bold',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: (size.height + size.width) / 82,
                              left: (size.height + size.width) / 65,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Saiba mais".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: (size.height + size.width) / 130,
                                    color: KPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans-bold',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/detalhesCursos",
            arguments: classes,
          ),
        },
      ),
    );
  }
}
