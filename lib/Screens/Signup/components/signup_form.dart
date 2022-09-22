import 'dart:math';

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

enum SingingSex { M, F, O }

class _SignUpFormState extends State<SignUpForm> {
  SingingCharacter? userType = SingingCharacter.aluno;
  SingingSex? sex = SingingSex.O;
  late String userEmail;
  late String userSenha;

  final formKey = GlobalKey<FormState>();
  bool isloading = false;

  String email = "";
  String password = "";
  String name = "";
  String cpf = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      top: (size.height + size.width) / 110,
                      bottom: (size.height + size.width) / 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 70,
                        child: Column(
                          children: [
                            RadioListTile<SingingCharacter>(
                              value: SingingCharacter.aluno,
                              groupValue: userType,
                              onChanged: (SingingCharacter? value) {
                                setState(
                                  () {
                                    userType = value;
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
                              groupValue: userType,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  userType = value;
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
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: KPrimaryColor,
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      return null;
                    } else {
                      return "Name cannot be empty";
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Nome",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: KPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "CPF",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.add_card_sharp),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        cpf = val;
                      });
                    },
                    validator: (val) {
                      return RegExp(r"^[0-9]").hasMatch(val!) ? null : "";
                    },
                  ),
                ),
                TextFormField(
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
                        : "Please enter a valid email";
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  cursorColor: KPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "E-mail",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: KPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Senha",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gênero',
                      style: TextStyle(
                        fontSize: (size.height + size.width) / 180,
                        color: KTextcolorLight,
                        // fontFamily: 'OpenSans',
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (size.height + size.width) / 150,
                      bottom: (size.height + size.width) / 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 70,
                        child: Column(
                          children: [
                            RadioListTile<SingingSex>(
                              value: SingingSex.M,
                              groupValue: sex,
                              onChanged: (SingingSex? value) {
                                setState(
                                  () {
                                    sex = value;
                                  },
                                );
                              },
                            ),
                            Text(
                              'Masculino',
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
                            RadioListTile<SingingSex>(
                              value: SingingSex.F,
                              groupValue: sex,
                              onChanged: (SingingSex? value) {
                                setState(() {
                                  sex = value;
                                });
                              },
                            ),
                            Text(
                              'Feminino',
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
                        width: 100,
                        child: Column(
                          children: [
                            RadioListTile<SingingSex>(
                              value: SingingSex.O,
                              groupValue: sex,
                              onChanged: (SingingSex? value) {
                                setState(() {
                                  sex = value;
                                });
                              },
                            ),
                            Text(
                              'Não informar',
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
                const SizedBox(height: defaultPadding / 2),
                ElevatedButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     duration: const Duration(seconds: 2),
                    //     content: CustomSnackbar(
                    //       textoMensagem:
                    //           "Não foi possivel se cadastrar. Tente Novamente",
                    //     ),
                    //     behavior: SnackBarBehavior.floating,
                    //     backgroundColor: Colors.transparent,
                    //     elevation: 0,
                    //   ),
                    // );
                    print(name);
                    print(cpf);
                    print(email);
                    print(password);
                    print(userType);
                    print(sex);

                    // register();
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

  register() async {
    if (formKey.currentState!.validate()) {}
  }
}
