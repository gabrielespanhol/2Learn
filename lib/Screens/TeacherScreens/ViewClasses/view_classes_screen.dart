import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/ViewClasses/mobile_view_classes_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/ViewClasses/web_view_classes_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class ViewClasses extends StatelessWidget {
  const ViewClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileViewClasses(),
          desktop: WebViewClasses(),
        ),
      ),
    );
  }
}