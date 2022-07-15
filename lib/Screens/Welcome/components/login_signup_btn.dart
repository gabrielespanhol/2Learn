import 'package:flutter/material.dart';
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
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Container(
            decoration: BoxDecoration(
              
            ),
            child: Text('Venha ter a liberdade de construir seu próprio conhecimento!',
              style: TextStyle(
                    fontSize: (size.height+size.width)/130,
                    color: KTextcolor,
                ),),
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
              primary: kPrimaryLightColor, elevation: 0),
          child: Text(
            "Cadastre-se".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
