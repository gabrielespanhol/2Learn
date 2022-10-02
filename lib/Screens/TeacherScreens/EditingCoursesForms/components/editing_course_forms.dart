// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/custom_snackbar.dart';
import 'package:flutter_web_1/Screens/Components/logo_image.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Models/classes.dart';
import 'package:flutter_web_1/constant.dart';

class EditingCoursesForms extends StatefulWidget {
  final Classes classes;
  const EditingCoursesForms({Key? key, required this.classes})
      : super(key: key);

  @override
  State<EditingCoursesForms> createState() => _EditingCoursesFormsState();
}

@override
void initState() {
  initState();
}

String? category, numberClasses, durationClasses;

TextEditingController controllerclassName = TextEditingController();
TextEditingController controllerdescription = TextEditingController();
TextEditingController controllershortDescription = TextEditingController();
TextEditingController controllervalueClasses = TextEditingController();

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

bool isloading = false;

class _EditingCoursesFormsState extends State<EditingCoursesForms> {
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    category = widget.classes.category;
    numberClasses = widget.classes.numberClasses;
    durationClasses = widget.classes.durationClasses;

    controllerclassName =
        TextEditingController(text: '${widget.classes.className}');
    controllerdescription =
        TextEditingController(text: '${widget.classes.description}');
    controllershortDescription =
        TextEditingController(text: '${widget.classes.shortDescription}');
    controllervalueClasses =
        TextEditingController(text: '${widget.classes.valueClasses}');

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
                                      onSaved: (value) {
                                        category = value;
                                      },
                                      onChanged: (String? value) => {
                                        setState(() {
                                          category = value;
                                        })
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return "Selecione a categoria";
                                        } else {
                                          return null;
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
                                        onSaved: (value) {
                                          numberClasses = value;
                                        },
                                        onChanged: (String? value) => {
                                          setState(() {
                                            numberClasses = value;
                                          })
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return "Selecione o numero de aulas";
                                          } else {
                                            return null;
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
                                      onSaved: (value) {
                                        durationClasses = value;
                                      },
                                      onChanged: (String? value) => {
                                        setState(() {
                                          durationClasses = value;
                                        })
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return "Selecione a duração da aula";
                                        } else {
                                          return null;
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
                            controller: controllerclassName,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (val) {
                              setState(() {
                                controllerclassName =
                                    val as TextEditingController;
                              });
                            },
                            validator: (val) {
                              if (val!.length < 6) {
                                return "O Titulo deve ser preenchido";
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
                            controller: controllerdescription,
                            maxLines: maxLines,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (val) {
                              setState(() {
                                controllerdescription =
                                    val as TextEditingController;
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
                                      controller: controllershortDescription,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: KPrimaryColor,
                                      onChanged: (val) {
                                        setState(() {
                                          controllershortDescription =
                                              val as TextEditingController;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.length < 10) {
                                          return "Descrição resumida muito pequena";
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
                                      controller: controllervalueClasses,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: KPrimaryColor,
                                      onChanged: (val) {
                                        setState(() {
                                          controllervalueClasses =
                                              val as TextEditingController;
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
                                      Navigator.pop(context, "");
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
                                      formKey?.currentState!.save();
                                      formKey?.currentState!.validate();

                                      updateClass();
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

  updateClass() async {
    if (formKey!.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
          .updateClass(
        widget.classes.classId!,
        controllerclassName.text,
        controllerdescription.text,
        controllershortDescription.text,
        durationClasses!,
        numberClasses!,
        controllervalueClasses.text,
        category!,
      )
          .whenComplete(() {
        isloading = false;
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const EditingCourses()),
        // );
        Navigator.pushNamed(
          context,
          "/homeScreenTeacher",
        );
        snackBarSuccessCadastroCursoAtualizado();
      });
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      snackBarSuccessCadastroCursoAtualizado() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: CustomSnackbar(
          textoMensagem: "Cadastro de aula Atualizado",
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
