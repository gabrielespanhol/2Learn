// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Controlers/helper_function.dart';
import 'package:flutter_web_1/constant.dart';

class RegisterCourseForms extends StatefulWidget {
  const RegisterCourseForms({Key? key}) : super(key: key);

  @override
  State<RegisterCourseForms> createState() => _RegisterCourseFormsState();
}

List<DropdownMenuItem<String>> get dropdownItemsCategorias {
  List<DropdownMenuItem<String>> menuItemsCategorias = [
    const DropdownMenuItem(value: "tecnologia", child: Text("Tecnologia")),
    const DropdownMenuItem(
        value: "machinelearning", child: Text("Machine learning")),
    const DropdownMenuItem(value: "matematica", child: Text("matemática")),
    const DropdownMenuItem(value: "artes", child: Text("artes")),
    const DropdownMenuItem(value: "gastronomia", child: Text("gastronomia")),
    const DropdownMenuItem(value: "design", child: Text("design")),
    const DropdownMenuItem(value: "robotica", child: Text("robótica")),
    const DropdownMenuItem(value: "moda", child: Text("moda")),
    const DropdownMenuItem(value: "maquiagem", child: Text("maquiagem")),
    const DropdownMenuItem(value: "idiomas", child: Text("idiomas")),
    const DropdownMenuItem(value: "historia", child: Text("historia")),
    const DropdownMenuItem(value: "quimica", child: Text("química")),
    const DropdownMenuItem(value: "geometria", child: Text("geometria")),
    const DropdownMenuItem(value: "portugues", child: Text("português")),
    const DropdownMenuItem(value: "redacao", child: Text("redação")),
    const DropdownMenuItem(value: "Filosofia", child: Text("Filosofia")),
    const DropdownMenuItem(value: "Sociologia", child: Text("Sociologia")),
    const DropdownMenuItem(value: "libras", child: Text("libras")),
    const DropdownMenuItem(value: "outros", child: Text("outros")),
  ];

  return menuItemsCategorias;
}

List<DropdownMenuItem<String>> get dropdownItemsAulas {
  List<DropdownMenuItem<String>> menuItemsAulas = [
    const DropdownMenuItem(value: "1", child: Text("1")),
    const DropdownMenuItem(value: "2", child: Text("2")),
    const DropdownMenuItem(value: "3", child: Text("3")),
    const DropdownMenuItem(value: "4", child: Text("4")),
    const DropdownMenuItem(value: "5", child: Text("5")),
    const DropdownMenuItem(value: "6", child: Text("6")),
    const DropdownMenuItem(value: "7", child: Text("7")),
    const DropdownMenuItem(value: "8", child: Text("8")),
    const DropdownMenuItem(value: "9", child: Text("9")),
    const DropdownMenuItem(value: "10", child: Text("10")),
    const DropdownMenuItem(value: "11", child: Text("11")),
    const DropdownMenuItem(value: "12", child: Text("12")),
    const DropdownMenuItem(value: "13", child: Text("13")),
    const DropdownMenuItem(value: "14", child: Text("14")),
    const DropdownMenuItem(value: "15", child: Text("15")),
  ];

  return menuItemsAulas;
}

List<DropdownMenuItem<String>> get dropdownItemsTempoAula {
  List<DropdownMenuItem<String>> menuItemsTempoAula = [
    const DropdownMenuItem(value: "15", child: Text("15 Minutos")),
    const DropdownMenuItem(value: "30", child: Text("30 Minutos")),
    const DropdownMenuItem(value: "45", child: Text("45 Minutos")),
    const DropdownMenuItem(value: "50", child: Text("50 Minutos")),
    const DropdownMenuItem(value: "60", child: Text("60 Minutos")),
    const DropdownMenuItem(value: "90", child: Text("90 Minutos")),
    const DropdownMenuItem(value: "120", child: Text("120 Minutos")),
    const DropdownMenuItem(value: "180", child: Text("180 Minutos")),
    const DropdownMenuItem(value: "220", child: Text("220 Minutos")),
  ];

  return menuItemsTempoAula;
}

class _RegisterCourseFormsState extends State<RegisterCourseForms> {
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  bool isloading = false;

  String? category,
      numberClasses,
      durationClasses,
      className,
      description,
      shortDescription,
      valueClasses;

  String userName = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserNameFromSF().then((valueName) {
      setState(() {
        userName = valueName!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const maxLines = 5;
    Size size = MediaQuery.of(context).size;
    double textPadding1 = (size.height + size.width) / 130;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (size.height + size.width) / 2,
                    child: Column(
                      children: [
                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    width: (size.height + size.width) / 6.2,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(bottom: textPadding1),
                                      child: Text(
                                        "CATEGORIA",
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
                                    width: (size.height + size.width) / 6.2,
                                    child: DropdownButtonFormField<String>(
                                      hint: const Text(
                                          "Selecione a categoria da aula"),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: textFildHeight,
                                            horizontal:
                                                (size.height + size.width) /
                                                    150),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: kFormsGray,
                                      ),
                                      value: category,
                                      onChanged: (String? value) => {
                                        setState(() {
                                          category = value;
                                        })
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return "Selecione a categoria";
                                        } else {
                                          category = value;
                                        }
                                      },
                                      items: dropdownItemsCategorias,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: (size.height + size.width) / 17,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: (size.height + size.width) / 10,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: textPadding1),
                                        child: Text(
                                          "Quantidade de Aulas".toUpperCase(),
                                          style: TextStyle(
                                            fontSize:
                                                (size.height + size.width) /
                                                    150,
                                            color: KTextcolorLight,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: (size.height + size.width) / 10,
                                      child: DropdownButtonFormField<String>(
                                        hint: const Text("0"),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: textFildHeight,
                                              horizontal:
                                                  (size.height + size.width) /
                                                      150),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kFormsGray, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kFormsGray),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          fillColor: kFormsGray,
                                        ),
                                        value: numberClasses,
                                        onChanged: (String? value) => {
                                          setState(() {
                                            numberClasses = value;
                                          })
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return "Selecione o numero de aulas";
                                          } else {
                                            numberClasses = value;
                                          }
                                        },
                                        items: dropdownItemsAulas,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: (size.height + size.width) / 10,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(bottom: textPadding1),
                                      child: Text(
                                        "Duração da Aula".toUpperCase(),
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
                                    width: (size.height + size.width) / 10,
                                    child: DropdownButtonFormField<String>(
                                      hint: const Text("0 Minutos"),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: textFildHeight,
                                            horizontal:
                                                (size.height + size.width) /
                                                    150),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: kFormsGray,
                                      ),
                                      value: durationClasses,
                                      onChanged: (String? value) => {
                                        setState(() {
                                          durationClasses = value;
                                        })
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return "Selecione a duração da aula";
                                        } else {
                                          durationClasses = value;
                                        }
                                      },
                                      items: dropdownItemsTempoAula,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // className

                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: textPadding2),
                            child: Text(
                              "Título".toUpperCase(),
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
                            // controller: controladorIitulo,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (val) {
                              setState(() {
                                className = val;
                              });
                            },
                            validator: (val) {
                              if (val!.length < 10) {
                                return "O className deve ser preenchido";
                              } else if (val!.length > 30) {
                                return "O nome da aula está muito grande";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: textFildHeight,
                                  horizontal: (size.height + size.width) / 150),
                              hintText: "Título da sua aula",
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
                              "Descrição".toUpperCase(),
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
                            // controller: controladordescription,
                            maxLines: maxLines,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (val) {
                              setState(() {
                                description = val;
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
                              hintText: "Coloque aqui a descrição da aula...",
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

                        SizedBox(
                          width: (size.height + size.width) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                // descrição resumida
                                children: <Widget>[
                                  SizedBox(
                                    width: (size.height + size.width) / 2.6,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: textPadding2),
                                      child: Text(
                                        "Descrição resumida".toUpperCase(),
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
                                    width: (size.height + size.width) / 2.6,
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      cursorColor: KPrimaryColor,
                                      onChanged: (val) {
                                        setState(() {
                                          shortDescription = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.length < 10) {
                                          return "Descrição resumida muito pequena";
                                        } else if (val.length > 89) {
                                          return "Descrição resumida muito grande";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: textFildHeight,
                                            horizontal:
                                                (size.height + size.width) /
                                                    150),
                                        hintText:
                                            "Coloque aqui uma breve descrição da aula...",
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: kFormsGray,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                // Valor Total
                                children: <Widget>[
                                  SizedBox(
                                    width: (size.height + size.width) / 14,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: textPadding2),
                                      child: Text(
                                        "Valor Total".toUpperCase(),
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
                                    width: (size.height + size.width) / 14,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: KPrimaryColor,
                                      onChanged: (val) {
                                        setState(() {
                                          valueClasses = val;
                                        });
                                      },
                                      validator: (val) {
                                        return RegExp(r"^[0-9]").hasMatch(val!)
                                            ? null
                                            : "Valor deve ser numerico";
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: textFildHeight,
                                            horizontal:
                                                (size.height + size.width) /
                                                    150),
                                        hintText: "R\$10,00",
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: kFormsGray),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: kFormsGray,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                                      Navigator.pushNamed(
                                        context,
                                        "/homeScreenTeacher",
                                      );
                                    },
                                  ),
                                ),
                                //CreateCourseBotton(),
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
                                      //formKey?.currentState!.validate();

                                      // ScaffoldMessenger.of(context).showSnackBar(
                                      //   SnackBar(
                                      //     duration: const Duration(seconds: 2),
                                      //     content: CustomSnackbar(
                                      //         textoMensagem: "Aula cadastrada",
                                      //         corPrimaria: Colors.lightGreen,
                                      //         corSecundaria: const Color.fromARGB(
                                      //             255, 112, 158, 60)),
                                      //     behavior: SnackBarBehavior.floating,
                                      //     backgroundColor: Colors.transparent,
                                      //     elevation: 0,
                                      //   ),
                                      // );
                                      createClass();
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
                  SizedBox(
                    height: (size.height + size.width) / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        LogoImage(width: (size.height + size.width) / 28)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }

  createClass() async {
    if (formKey!.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
          .createClass(
        userName,
        FirebaseAuth.instance.currentUser!.uid,
        className!,
        description!,
        shortDescription!,
        durationClasses!,
        numberClasses!,
        valueClasses!,
        category!,
      )
          .whenComplete(() {
        isloading = false;
        Navigator.of(context).pop();
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
          textoMensagem: "Cadastro de aula realizado",
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
