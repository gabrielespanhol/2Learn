import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/ClassRoom/mobile_class_room.dart';
import 'package:flutter_web_1/Screens/ClassRoom/web_class_room.dart';
import 'package:flutter_web_1/responsive.dart';

class ClassRoom extends StatelessWidget {
  const ClassRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileClassRoom(),
          desktop: WebClassRoom(),
        ),
      ),
    );
  }
}
