import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/already_have_an_account_acheck.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/constant.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String userEmail;
  late String userSenha;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: KPrimaryColor,
            onChanged: (value) => setState(
              () {
                userEmail = value;
                // print(userEmail);
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
                  // print(userSenha);
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
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                // print("Email: $userEmail");
                try {
                  if (userEmail == "aluno") {
                    Navigator.pushNamed(
                      context,
                      "/cursosContratados",
                    );
                  } else if (userEmail == "tutor") {
                    // manda pra tela de tutor
                  } else if (userEmail != "tutor" && userEmail != "aluno") {
                    throw Exception();
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      content: CustomSnackbar(
                        textoMensagem: "Email invalido. Tente novamente",
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                }
              },
              child: Text(
                "Login".toUpperCase(),
                style: const TextStyle(color: KTextcolor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () => {
              Navigator.pushNamed(
                context,
                "/cadastro",
              ),
            },
          ),
        ],
      ),
    );
  }
}
