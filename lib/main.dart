// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Login/login_screen.dart';
import 'package:flutter_web_1/Screens/Signup/signup_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ContractedCourses/contracted_courses_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/course_category_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/course_details_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/view_courses_screen.dart';
import 'package:flutter_web_1/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_web_1/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => SignUpScreen(),
        '/cursosContratados': (context) => ContractedCourses(),
        '/pesquisaCursosCategoria': (context) => CoursesCategory(),
        '/visualizarCursos': (context) => ViewCourses(),
        '/detalhesCursos': (context) => CourseDetails(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: KPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: KPrimaryColor,
              shape: StadiumBorder(),
              maximumSize: Size(double.infinity, 48),
              minimumSize: Size(double.infinity, 48),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: KPrimaryColor,
            prefixIconColor: KPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
    );
  }
}
