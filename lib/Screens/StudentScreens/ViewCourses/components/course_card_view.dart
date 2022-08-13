import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/teachers.dart';
import 'package:flutter_web_1/constant.dart';

class CourseCardView extends StatelessWidget {
  final Teachers teacher;
  String? category;
  Color? color;

  CourseCardView({Key? key, required this.teacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
          width: (size.height + size.width) / 12,
          height: (size.height + size.width) / 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: KPrimaryGrey,
          ),
          child: Column(
            children: const <Widget>[],
          )),
      onTap: () => {
        Navigator.pushNamed(
          context,
          "/detalhesCursos",

          // criar parametro de categoria de curso nessa classa para poder passar como parametro para a proxima tela
        ),
      },
    );
  }
}
