import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/already_have_an_account_acheck.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/helper_function.dart';
import 'package:flutter_web_1/constant.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

// ignore: constant_identifier_names
enum UserType { Aluno, Tutor }

enum UserSex { M, F, O }

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String name = "";
  String cpf = "";
  UserType? userType = UserType.Aluno;
  UserSex? userSex = UserSex.O;

  bool isloading = false;

  AuthService authService = AuthService();

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
                            RadioListTile<UserType>(
                              value: UserType.Aluno,
                              groupValue: userType,
                              onChanged: (UserType? value) {
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
                            RadioListTile<UserType>(
                              value: UserType.Tutor,
                              groupValue: userType,
                              onChanged: (UserType? value) {
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
                      return "Campo precisa ser preenchido";
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
                      return RegExp(r"^[0-9]").hasMatch(val!)
                          ? null
                          : "Apenas numeros do CPF";
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
                        : "Por favor digite um email válido";
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
                        return "A senha deve ter pelo menos 6 caracteres";
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
                            RadioListTile<UserSex>(
                              value: UserSex.M,
                              groupValue: userSex,
                              onChanged: (UserSex? value) {
                                setState(
                                  () {
                                    userSex = value;
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
                            RadioListTile<UserSex>(
                              value: UserSex.F,
                              groupValue: userSex,
                              onChanged: (UserSex? value) {
                                setState(() {
                                  userSex = value;
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
                            RadioListTile<UserSex>(
                              value: UserSex.O,
                              groupValue: userSex,
                              onChanged: (UserSex? value) {
                                setState(() {
                                  userSex = value;
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
                    // print(name);
                    // print(cpf);
                    // print(email);
                    // print(password);
                    //print(userType.toString());
                    //print(userSex.toString());

                    register();
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
    if (formKey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      await authService
          .registerUserWithEmailandPassword(
              name, email, password, userType.toString(), userSex.toString())
          .then((value) async {
        if (value == true) {
          // saving the preference state

          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(name);
          await HelperFunctions.saveuserTypeKey(userType.toString());
          await HelperFunctions.saveSexlKey(userSex.toString());
          setState(() {
            isloading = false;
          });
          snackBarSuccess();
        } else {
          snackBarError();
          setState(() {
            isloading = false;
          });
        }
      });
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarError() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: CustomSnackbar(
          textoMensagem: "Não foi possivel se cadastrar. Tente Novamente",
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarSuccess() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: CustomSnackbar(
          textoMensagem: "Cadastro realizado",
          corPrimaria: Colors.green,
          corSecundaria: const Color.fromARGB(255, 64, 148, 67),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
