import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/course_category.dart';
import 'package:flutter_web_1/constant.dart';

// ignore: must_be_immutable
class CourseCardcategory extends StatelessWidget {
  final CourseCategory courseCategory;

  const CourseCardcategory({Key? key, required this.courseCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? color;
    if (courseCategory.nomeCategoria.toString() == "outros") {
      color = KPrimaryColor;
    }

    Size size = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          width: (size.height + size.width) / 12,
          height: (size.height + size.width) / 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: KPrimaryGrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Text(
                  courseCategory.nomeCategoria.toString().toUpperCase(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: (size.height + size.width) / 190,
                    color: color ?? Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/visualizarCursos",
            arguments: courseCategory.nomeCategoria.toString().toUpperCase(),
          ),
        },
      ),
    );
  }
}
