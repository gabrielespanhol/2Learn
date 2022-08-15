import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/teachers.dart';
import 'package:flutter_web_1/constant.dart';

import '../Components/menu_student_search.dart';

// ignore: must_be_immutable
class WebCourseDetails extends StatelessWidget {
  Teachers teachers = Teachers();
  WebCourseDetails({
    Key? key,
    required this.teachers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var caminhoFoto = teachers.caminhoFoto;
    var valorCurso = teachers.valorCurso.toString();

    return Column(
      children: [
        MenuStudentSearch(title: teachers!.categoria.toString()),
        Padding(
          padding: EdgeInsets.only(top: (size.height + size.width) / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          teachers.nomeTutor.toString(),
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
                          teachers.sobrenomeTutor.toString(),
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
                      teachers.profissaoTutor.toString(),
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
                          teachers.formacaoAcademica.toString(),
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
                            teachers.descricaoTutor.toString(),
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
              // outra parta da descrição

              SizedBox(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 11,
              ),

              SizedBox(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 4,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          teachers.nomeCurso.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            teachers.valorCurso.toString(),
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 140,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans-regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: (size.height + size.width) / 40),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: (size.height + size.width) / 4,
                            child: Text(
                              textAlign: TextAlign.justify,
                              teachers.descricaoTutor.toString(),
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 140,
                                color: KTextcolor,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 70,
                          top: (size.height + size.width) / 11,
                          bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          LogoImage(width: (size.height + size.width) / 25),
                        ],
                      ),
                    )
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
