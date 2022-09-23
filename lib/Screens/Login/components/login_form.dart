// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/already_have_an_account_acheck.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Controlers/helper_function.dart';
import 'package:flutter_web_1/constant.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isloading = false;
  AuthService authService = AuthService();

  late QueryDocumentSnapshot<Object?> userteste;

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Center(
            child: CircularProgressIndicator(
              color: KPrimaryColor,
            ),
          )
        : Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: KPrimaryColor,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },

                  // check tha validation
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Por favor digite um email válido";
                  },
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
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (val) {
                      if (val!.length < 6) {
                        return "A senha deve ter pelo menos 6 caracteres";
                      } else {
                        return null;
                      }
                    },
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
                ElevatedButton(
                  onPressed: () {
                    // try {
                    //   if (email == "a") {
                    //     Navigator.pushNamed(
                    //       context,
                    //       "/cursosContratados",
                    //     );
                    //   } else if (email == "t") {
                    //     Navigator.pushNamed(
                    //       context,
                    //       "/homeScreenTeacher",
                    //     );
                    //   } else if (email != "t" && email != "a") {
                    //     throw Exception();
                    //   }
                    // } catch (e) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       duration: const Duration(seconds: 2),
                    //       content: CustomSnackbar(
                    //         textoMensagem: "Email invalido. Tente novamente",
                    //       ),
                    //       behavior: SnackBarBehavior.floating,
                    //       backgroundColor: Colors.transparent,
                    //       elevation: 0,
                    //     ),
                    //   );
                    // }
                    //print(email);
                    //print(password);
                    login();
                  },
                  child: Text(
                    "Login".toUpperCase(),
                    style: const TextStyle(color: KTextcolor),
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

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      await authService
          .loginWithUserNameandPassword(
        email,
        password,
      )
          .then((value) async {
        if (value == true) {
          // saving the preference state
          QuerySnapshot snapshot = await DatabaseServices(
                  uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(email);
          // saving the values to our shared preferences

          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
          print(snapshot.docs[0]['fullName']);
          print(snapshot.docs[0]['userType']);
          print(snapshot.docs[0]['userSex']);

          if (snapshot.docs[0]['userType'] == "UserType.Aluno") {
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(
              context,
              "/cursosContratados",
            );
          } else {
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(
              context,
              "/homeScreenTeacher",
            );
          }

          setState(() {
            isloading = false;
          });
        } else {
          snackBarErrorlogin();
          setState(() {
            isloading = false;
          });
        }
      });
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      snackBarErrorlogin() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: CustomSnackbar(
          textoMensagem: "Email ou senha invalidos. Tente novamente",
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
