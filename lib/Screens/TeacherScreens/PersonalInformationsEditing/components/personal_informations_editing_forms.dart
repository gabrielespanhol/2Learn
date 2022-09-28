// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Models/FinalModels/user.dart';
import 'package:flutter_web_1/constant.dart';

class PersonalInformationsEditingForms extends StatefulWidget {
  const PersonalInformationsEditingForms({Key? key}) : super(key: key);

  @override
  State<PersonalInformationsEditingForms> createState() =>
      _PersonalInformationsEditingFormsState();
}

class _PersonalInformationsEditingFormsState
    extends State<PersonalInformationsEditingForms> {
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  bool isloading = false;

  String userName = "";
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerAcademicFormation = TextEditingController();
  TextEditingController controllerPersonalDescripition =
      TextEditingController();
  TextEditingController controllerProfession = TextEditingController();

  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  List<Users> userDataList = [];
  gettingUserData() async {
    try {
      await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
          .getUserData(FirebaseAuth.instance.currentUser!.uid)
          .then((snapshot) {
        setState(() {
          userDataList = snapshot;
          controllerName.text = userDataList[0].name.toString();
          controllerLastName.text = userDataList[0].lastName.toString();
          controllerAcademicFormation.text =
              userDataList[0].academicFormation.toString();
          controllerPersonalDescripition.text =
              userDataList[0].personalDescription.toString();
          controllerProfession.text = userDataList[0].profession.toString();
        });
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const maxLines = 5;
    Size size = MediaQuery.of(context).size;
    double textPadding2 = (size.height + size.width) / 120;
    double textFildHeight = (size.height + size.width) / 110;

    return isloading
        ? const Center(
            child: CircularProgressIndicator(
              color: KPrimaryColor,
            ),
          )
        : Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (size.height + size.width) / 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: (size.height + size.width) / 2,
                    child: Column(
                      children: [
                        // nome e sobre nome
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // nome
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  width: (size.height + size.width) / 4.2,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: textPadding2),
                                    child: Text(
                                      "nome".toUpperCase(),
                                      style: TextStyle(
                                        fontSize:
                                            (size.height + size.width) / 150,
                                        color: KTextcolorLight,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (size.height + size.width) / 4.2,
                                  child: TextFormField(
                                    controller: controllerName,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: KPrimaryColor,
                                    onChanged: (val) {
                                      setState(() {
                                        // controllerName.text = val;
                                      });
                                    },
                                    validator: (val) {
                                      if (val!.length < 1) {
                                        return "O nome deve ser preenchido";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: textFildHeight,
                                          horizontal:
                                              (size.height + size.width) / 150),
                                      hintText: "Seu nome",
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: kFormsGray, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: kFormsGray),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      fillColor: kFormsGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // sobre nome
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  width: (size.height + size.width) / 4.2,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: textPadding2),
                                    child: Text(
                                      "Sobrenome".toUpperCase(),
                                      style: TextStyle(
                                        fontSize:
                                            (size.height + size.width) / 150,
                                        color: KTextcolorLight,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (size.height + size.width) / 4.2,
                                  child: TextFormField(
                                    controller: controllerLastName,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: KPrimaryColor,
                                    onChanged: (val) {
                                      setState(() {
                                        // controllerLastName.text = val;
                                      });
                                    },
                                    validator: (val) {
                                      if (val!.length < 1) {
                                        return "Seu sobrenome deve ser preenchido";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: textFildHeight,
                                          horizontal:
                                              (size.height + size.width) / 150),
                                      hintText: "Seu sobrenome",
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: kFormsGray, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: kFormsGray),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      fillColor: kFormsGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Profissão

                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: textPadding2),
                            child: Text(
                              "Profissão".toUpperCase(),
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 150,
                                color: KTextcolorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: TextFormField(
                            controller: controllerProfession,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (val) {
                              setState(() {
                                // controllerAcademicFormation.text = val;
                              });
                            },
                            validator: (val) {
                              if (val!.length < 1) {
                                return "A Profissão deve ser preenchida";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: textFildHeight,
                                  horizontal: (size.height + size.width) / 150),
                              hintText: "Coloque aqui sua profissão",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: kFormsGray, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kFormsGray),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: kFormsGray,
                            ),
                          ),
                        ),
                        // formação academica

                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: textPadding2),
                            child: Text(
                              "Formação academica".toUpperCase(),
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 150,
                                color: KTextcolorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: TextFormField(
                            controller: controllerAcademicFormation,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (val) {
                              setState(() {
                                // controllerAcademicFormation.text = val;
                              });
                            },
                            validator: (val) {
                              if (val!.length < 1) {
                                return "A formação academica deve ser preenchida";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: textFildHeight,
                                  horizontal: (size.height + size.width) / 150),
                              hintText:
                                  "Coloque aqui sua formação academica principal",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: kFormsGray, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kFormsGray),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: kFormsGray,
                            ),
                          ),
                        ),

                        //decrição

                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: textPadding2),
                            child: Text(
                              "Descrição pessoal".toUpperCase(),
                              style: TextStyle(
                                fontSize: (size.height + size.width) / 150,
                                color: KTextcolorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: TextFormField(
                            controller: controllerPersonalDescripition,
                            maxLines: maxLines,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (val) {
                              setState(() {
                                //controllerPersonalDescripition.text = val;
                              });
                            },
                            validator: (val) {
                              if (val!.length < 10) {
                                return "Descrição muito pequena";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: (size.height + size.width) / 160,
                                horizontal: (size.height + size.width) / 150,
                              ),
                              hintText:
                                  "Coloque aqui a descrição que gostaria que seus futuros alunos vissem sobre você, conhecimentos, experiências, etc...",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: kFormsGray, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kFormsGray),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: kFormsGray,
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(top: size.height + size.width) /
                                  60,
                          child: SizedBox(
                            width: (size.height + size.width) / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 15),
                                      decoration: BoxDecoration(
                                          color: KPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        "Voltar".toUpperCase(),
                                        style: const TextStyle(
                                            color: KTextcolorLight,
                                            fontSize: 20,
                                            fontFamily: 'OpenSans-bold',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 15),
                                      decoration: BoxDecoration(
                                          color: KPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        "Salvar".toUpperCase(),
                                        style: const TextStyle(
                                            color: KTextcolorLight,
                                            fontSize: 20,
                                            fontFamily: 'OpenSans-bold',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    onTap: () {
                                      updataTutor();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  updataTutor() async {
    if (formKey!.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
          .updatingUserData(
        controllerName.text,
        controllerLastName.text,
        controllerAcademicFormation.text,
        controllerPersonalDescripition.text,
        controllerProfession.text,
      )
          .whenComplete(() {
        isloading = false;
        // Navigator.pushNamed(
        //   context,
        //   "/homeScreenTeacher",
        // );
        // Navigator.pop(context);
        Navigator.pop(context, controllerName.text);
        snackBarSuccessCadastroCurso();
      });
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      snackBarSuccessCadastroCurso() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: CustomSnackbar(
          textoMensagem: "Cadastro do tutor atualizado",
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
