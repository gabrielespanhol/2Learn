import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/course_category.dart';
import 'package:flutter_web_1/Models/courses.dart';
import 'package:flutter_web_1/Screens/StudentScreens/Components/menu_student_search.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseSearch/components/course_card_category.dart';

class WebCourseSearch extends StatelessWidget {
  const WebCourseSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    CourseCategory tecnologia = CourseCategory(nomeCategoria: "tecnologia");
    CourseCategory matematica = CourseCategory(nomeCategoria: "matemática");
    CourseCategory artes = CourseCategory(nomeCategoria: "artes");
    CourseCategory gastronomia = CourseCategory(nomeCategoria: "gastronomia");
    CourseCategory design = CourseCategory(nomeCategoria: "design");
    CourseCategory robotica = CourseCategory(nomeCategoria: "robótica");
    CourseCategory moda = CourseCategory(nomeCategoria: "moda");
    CourseCategory maquiagem = CourseCategory(nomeCategoria: "maquiagem");
    CourseCategory idiomas = CourseCategory(nomeCategoria: "idiomas");

    return Column(
      children: [
        const MenuStudentSearch(title: "Categorias"),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CourseCardcategory(course: tecnologia),
              CourseCardcategory(course: matematica),
              CourseCardcategory(course: artes),
              CourseCardcategory(course: gastronomia),
              CourseCardcategory(course: design),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CourseCardcategory(course: robotica),
              CourseCardcategory(course: moda),
              CourseCardcategory(course: maquiagem),
              CourseCardcategory(course: idiomas),
              CourseCardcategory(course: tecnologia),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              LogoImage(width: 90),
            ],
          ),
        )
      ],
    );
  }
}
