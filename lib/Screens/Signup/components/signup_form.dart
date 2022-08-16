import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/already_have_an_account_acheck.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/constant.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

enum SingingCharacter { aluno, tutor }

class _SignUpFormState extends State<SignUpForm> {
  SingingCharacter? userTipo = SingingCharacter.aluno;
  late String userEmail;
  late String userSenha;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Oi! Posso te conhecer?',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 120,
                  color: KTextcolorLight,
                  // fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (size.height + size.width) / 100,
                bottom: (size.height + size.width) / 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 70,
                  child: Column(
                    children: [
                      RadioListTile<SingingCharacter>(
                        value: SingingCharacter.aluno,
                        groupValue: userTipo,
                        onChanged: (SingingCharacter? value) {
                          setState(
                            () {
                              userTipo = value;
                            },
                          );
                        },
                      ),
                      Text(
                        'Aluno',
                        style: TextStyle(
                          fontSize: (size.height + size.width) / 200,
                          color: KTextcolorLight,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 72,
                  child: Column(
                    children: [
                      RadioListTile<SingingCharacter>(
                        value: SingingCharacter.tutor,
                        groupValue: userTipo,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            userTipo = value;
                          });
                        },
                      ),
                      Text(
                        'Tutor',
                        style: TextStyle(
                          fontSize: (size.height + size.width) / 200,
                          color: KTextcolorLight,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: KPrimaryColor,
            onChanged: (value) => setState(
              () {
                userEmail = value;
              },
            ),
            decoration: const InputDecoration(
              hintText: "E-mail",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: KPrimaryColor,
              onChanged: (value) => setState(
                () {
                  userSenha = value;
                },
              ),
              decoration: const InputDecoration(
                hintText: "Senha",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: CustomSnackbar(
                    textoMensagem:
                        "Não foi possivel se cadastrar. Tente Novamente",
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              );
            },
            child: Text(
              "Cadastre-se".toUpperCase(),
              style: const TextStyle(color: KTextcolor),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () => {
              Navigator.pushNamed(
                context,
                "/login",
              ),
            },
          ),
        ],
      ),
    );
  }
}
