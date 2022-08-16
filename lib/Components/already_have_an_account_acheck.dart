import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            login ? "Não possui uma conta ? " : "Já possui uma conta ? ",
            style: const TextStyle(color: KPrimaryColor),
          ),
          GestureDetector(
            onTap: press as void Function()?,
            child: Text(
              login ? "Cadastre-se" : "Entrar",
              style: const TextStyle(
                color: KPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
