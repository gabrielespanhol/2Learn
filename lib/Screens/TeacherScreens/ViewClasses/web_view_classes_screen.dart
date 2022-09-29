import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/courses_contratados.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/ViewClasses/components/course_card_teacher_view.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

class WebViewClasses extends StatefulWidget {
  const WebViewClasses({
    Key? key,
  }) : super(key: key);

  @override
  State<WebViewClasses> createState() => _WebViewClassesState();
}

class _WebViewClassesState extends State<WebViewClasses> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // ignore: non_constant_identifier_names
    List<Courses> CourseCategoryList = [
      Courses(
        id: 1,
        nomeCurso: "Porcentagem Basica",
        aulaRealizada: 2,
        nomeTutor: "Douglas",
        nomeAluno: "Thiago",
        sexoAluno: "M",
        sexoTutor: "M",
        tipoCurso: "math",
        totalAulas: 3,
        proximoEncontro: "2° Feira",
      ),
      Courses(
        id: 1,
        nomeCurso: "NUMPY P/MACHINE LEARNING",
        aulaRealizada: 5,
        nomeTutor: "Isabella",
        nomeAluno: "Isadora",
        sexoAluno: "F",
        sexoTutor: "F",
        tipoCurso: "machinelearning",
        totalAulas: 6,
        proximoEncontro: "Amanhã",
      ),
      Courses(
        id: 1,
        nomeCurso: "Python basico",
        aulaRealizada: 5,
        nomeTutor: "Leonardo",
        nomeAluno: "Pedro",
        sexoAluno: "M",
        sexoTutor: "M",
        tipoCurso: "machinelearning",
        totalAulas: 6,
        proximoEncontro: "3° Feira",
      ),
      Courses(
        id: 1,
        nomeCurso: "Arquitetura de dados",
        aulaRealizada: 1,
        nomeTutor: "Gabriel",
        nomeAluno: "Felipe",
        sexoAluno: "M",
        sexoTutor: "M",
        tipoCurso: "machinelearning",
        totalAulas: 5,
        proximoEncontro: "6° Feira",
      ),
    ];

    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "${FirebaseAuth.instance.currentUser!.uid}.png",
          textoMenu: "VISUALIZAÇÃO DE AULAS",
        ),
        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4.3,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: (size.height + size.width) / 5,
            ),
            itemCount: CourseCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: (size.height + size.width) / 60,
                ),
                child: CourseCardTeacher(course: CourseCategoryList[index]),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: (size.height + size.width) / 30,
            right: (size.height + size.width) / 50,
            top: (size.height + size.width) / 280,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              LogoImage(width: 90),
            ],
          ),
        ),
      ],
    );
  }
}
