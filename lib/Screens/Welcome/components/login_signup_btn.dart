import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/constant.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[LogoImage(width: 150)],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Container(
            decoration: const BoxDecoration(),
            child: Text(
              'Venha ter a liberdade de construir seu próprio conhecimento!',
              style: TextStyle(
                fontSize: (size.height + size.width) / 130,
                color: KTextcolor,
              ),
            ),
          ),
        ),
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () => {
              Navigator.pushNamed(
                context,
                "/login",
              ),
            },
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(color: KTextcolor),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => {
            Navigator.pushNamed(
              context,
              "/cadastro",
            ),
          },
          style: ElevatedButton.styleFrom(
              primary: kSecondaryLightColor, elevation: 0),
          child: Text(
            "Cadastre-se".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
