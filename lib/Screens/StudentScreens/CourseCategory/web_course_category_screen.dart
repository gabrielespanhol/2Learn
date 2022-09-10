import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/course_category.dart';
import 'package:flutter_web_1/Screens/StudentScreens/Components/menu_student_search.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/components/course_card_category.dart';

class WebCoursesCategory extends StatelessWidget {
  const WebCoursesCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // ignore: non_constant_identifier_names
    List<CourseCategory> CourseCategoryList = [
      CourseCategory(nomeCategoria: "tecnologia"),
      CourseCategory(nomeCategoria: "machine learning"),
      CourseCategory(nomeCategoria: "matemática"),
      CourseCategory(nomeCategoria: "artes"),
      CourseCategory(nomeCategoria: "gastronomia"),
      CourseCategory(nomeCategoria: "design"),
      CourseCategory(nomeCategoria: "robótica"),
      CourseCategory(nomeCategoria: "moda"),
      CourseCategory(nomeCategoria: "maquiagem"),
      CourseCategory(nomeCategoria: "idiomas"),
      CourseCategory(nomeCategoria: "historia"),
      CourseCategory(nomeCategoria: "química"),
      CourseCategory(nomeCategoria: "geometria"),
      CourseCategory(nomeCategoria: "português"),
      CourseCategory(nomeCategoria: "redação"),
      CourseCategory(nomeCategoria: "Filosofia"),
      CourseCategory(nomeCategoria: "Sociologia"),
      CourseCategory(nomeCategoria: "libras"),
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
                  child: CourseCardcategory(
                      courseCategory: CourseCategoryList[index]));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 70,
            bottom: (size.height + size.width) / 200,
            top: (size.height + size.width) / 200,
          ),
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
