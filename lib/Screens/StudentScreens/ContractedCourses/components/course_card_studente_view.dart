import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/constant.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseCardStudent extends StatelessWidget {
  final String image;
  final String textDescripiton;

  const CourseCardStudent(
      {Key? key, required this.image, required this.textDescripiton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          width: (size.height + size.width) / 9,
          height: (size.height + size.width) / 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: KPrimaryGrey,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: (size.height + size.width) / 50,
                  bottom: (size.height + size.width) / 70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PutSvgImage(
                      image: image,
                      width: (size.height + size.width) / 15,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    textDescripiton,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (size.height + size.width) / 120,
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LinearPercentIndicator(
                      width: (size.height + size.width) / 13,
                      lineHeight: 15,
                      percent: 0.5,
                      progressColor: KPrimaryColor,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
