// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/default_button.dart';
import 'package:flutter_web_1/Components/menuItem.dart';


class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar
({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        
        color: Colors.white, 
        ),
        child: Row(
          children: <Widget>[
          MenuItemCuston(title: "Home", press: (){},),
          MenuItemCuston(title: "Sobre nos", press: (){},),
          MenuItemCuston(title: "Beneficios", press: (){},),
          MenuItemCuston(title: "Entrar", press: (){},),
          DefaultButton(text: "Cadastre-se", press: (){},)

          ],
        ),
    );
  }
}

