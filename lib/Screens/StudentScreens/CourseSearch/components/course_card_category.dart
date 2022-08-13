import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/course_category.dart';
import 'package:flutter_web_1/constant.dart';

class CourseCardcategory extends StatelessWidget {
  final CourseCategory course;

  const CourseCardcategory({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: [
          Container(
            width: (size.height + size.width) / 12,
            height: (size.height + size.width) / 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: KPrimaryGrey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Text(
                    course.nomeCategoria.toString().toUpperCase(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: (size.height + size.width) / 190,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
