// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/teste/user_model.dart';
import 'package:flutter_web_1/Screens/1teste/teste2homeCamera.dart';
import 'package:flutter_web_1/Screens/1teste/testecamera.dart';
import 'package:flutter_web_1/Screens/1teste/testehome.dart';
import 'package:flutter_web_1/Screens/ClassRoom/class_room.dart';
import 'package:flutter_web_1/Screens/Login/login_screen.dart';
import 'package:flutter_web_1/Screens/Signup/signup_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ContractedCourses/contracted_courses_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/course_category_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/course_details_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/view_courses_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCourses/web_editing_courses_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCoursesForms/editing_courses_forms_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/HomeTeacher/home_teacher_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/RegisterCourses/register_courses_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/ViewClasses/view_classes_screen.dart';
import 'package:flutter_web_1/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_web_1/Screens/ClassRoom/components/chat_widget.dart';
import 'package:flutter_web_1/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'assets/images/james.jpg',
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

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
        '/homeScreenTeacher': (context) => HomeTeacher(),
        '/visualizaraulas': (context) => ViewClasses(),
        '/CadastrarCurso': (context) => RegisterCourses(),
        '/visualizaraulasedicao': (context) => WebEditingCourses(),
        '/editaraulas': (context) => EditingCoursesForms(),
        '/aula': (context) => ClassRoom(),
        '/teste': (context) => HomePage1(),
        '/teste1': (context) => testeCamera()
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
          fillColor: kSecondaryLightColor,
          iconColor: KPrimaryColor,
          prefixIconColor: KPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
