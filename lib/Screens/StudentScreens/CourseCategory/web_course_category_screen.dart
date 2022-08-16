import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/course_category.dart';
import 'package:flutter_web_1/Screens/StudentScreens/Components/menu_student_search.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/components/course_card_category.dart';
import 'package:flutter_web_1/constant.dart';

class WebCoursesCategory extends StatelessWidget {
  const WebCoursesCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    CourseCategory tecnologia = CourseCategory(nomeCategoria: "tecnologia");
    CourseCategory matematica = CourseCategory(nomeCategoria: "matemática");
    CourseCategory artes = CourseCategory(nomeCategoria: "artes");
    CourseCategory gastronomia = CourseCategory(nomeCategoria: "gastronomia");
    CourseCategory design = CourseCategory(nomeCategoria: "design");
    CourseCategory robotica = CourseCategory(nomeCategoria: "robótica");
    CourseCategory moda = CourseCategory(nomeCategoria: "moda");
    CourseCategory maquiagem = CourseCategory(nomeCategoria: "maquiagem");
    CourseCategory idiomas = CourseCategory(nomeCategoria: "idiomas");
    CourseCategory outros = CourseCategory(nomeCategoria: "outros");

    List<CourseCategory> CourseCategoryList = [
      CourseCategory(nomeCategoria: "tecnologia"),
      CourseCategory(nomeCategoria: "matemática"),
      CourseCategory(nomeCategoria: "artes"),
      CourseCategory(nomeCategoria: "gastronomia"),
      CourseCategory(nomeCategoria: "design"),
      CourseCategory(nomeCategoria: "robótica"),
      CourseCategory(nomeCategoria: "moda"),
      CourseCategory(nomeCategoria: "maquiagem"),
      CourseCategory(nomeCategoria: "idiomas"),
      CourseCategory(nomeCategoria: "outros"),
    ];

    return Column(
      children: [
        MenuStudentSearch(title: "Categorias"),
        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: CourseCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(40),
                  child: CourseCardcategory(course: CourseCategoryList[index]));
            },
          ),
        ),

        // Padding(
        //   padding: EdgeInsets.only(
        //     top: (size.height + size.width) / 30,
        //     right: (size.height + size.width) / 60,
        //     left: (size.height + size.width) / 60,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       CourseCardcategory(course: tecnologia),
        //       CourseCardcategory(course: matematica),
        //       CourseCardcategory(course: artes),
        //       CourseCardcategory(course: gastronomia),
        //       CourseCardcategory(course: design),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(
        //     top: (size.height + size.width) / 35,
        //     bottom: (size.height + size.width) / 40,
        //     right: (size.height + size.width) / 60,
        //     left: (size.height + size.width) / 60,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       CourseCardcategory(course: robotica),
        //       CourseCardcategory(course: moda),
        //       CourseCardcategory(course: maquiagem),
        //       CourseCardcategory(course: idiomas),
        //       CourseCardcategory(
        //         course: outros,
        //         color: KPrimaryColor,
        //       ),
        //     ],
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 70, bottom: 50),
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
