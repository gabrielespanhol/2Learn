// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/default_button.dart';
import 'package:flutter_web_1/Components/web_menu_item.dart';

class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar({Key? key}) : super(key: key);

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
          MenuItemCuston(title: "Home", press: "/"),
          MenuItemCuston(title: "Sobre nos", press: "a"),
          MenuItemCuston(title: "Beneficios", press: "a"),
          MenuItemCuston(title: "Login", press: "/login"),
          DefaultButton(text: "Cadastre-se", press: "/cadastro")
        ],
      ),
    );
  }
}
