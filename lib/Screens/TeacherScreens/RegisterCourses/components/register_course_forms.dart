import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
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
  get selectedValue => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                width: (size.height + size.width) / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          width: (size.height + size.width) / 7.5,
                          child: Text(
                            "CATEGORIA",
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 150,
                              color: KTextcolorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 7.5,
                          child: DropdownButtonFormField(
                            hint: const Text("Selecione a categoria da aula"),
                            decoration: InputDecoration(
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
                            value: selectedValue,
                            onChanged: (value) => {},
                            items: dropdownItemsCategorias,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: (size.height + size.width) / 10,
                          child: Text(
                            "Quantidade de Aulas".toUpperCase(),
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 150,
                              color: KTextcolorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 10,
                          child: DropdownButtonFormField(
                            hint: const Text("0"),
                            decoration: InputDecoration(
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
                            value: selectedValue,
                            onChanged: (value) => {},
                            items: dropdownItemsAulas,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: (size.height + size.width) / 10,
                          child: Text(
                            "Duração de Aulas".toUpperCase(),
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 150,
                              color: KTextcolorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 10,
                          child: DropdownButtonFormField(
                            hint: const Text("0 Minutos"),
                            decoration: InputDecoration(
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
                            value: selectedValue,
                            onChanged: (value) => {},
                            items: dropdownItemsTempoAula,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Titulo

              SizedBox(
                width: (size.height + size.width) / 2,
                child: Text(
                  "Titulo".toUpperCase(),
                  style: TextStyle(
                    fontSize: (size.height + size.width) / 150,
                    color: KTextcolorLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: (size.height + size.width) / 2,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: KPrimaryColor,
                  onChanged: (value) => setState(
                    () {},
                  ),
                  decoration: InputDecoration(
                    hintText: "Descreva aqui o título da sua aula",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: kFormsGray, width: 2),
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
                child: Text(
                  "Descrição".toUpperCase(),
                  style: TextStyle(
                    fontSize: (size.height + size.width) / 150,
                    color: KTextcolorLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: (size.height + size.width) / 2,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: KPrimaryColor,
                  onChanged: (value) => setState(
                    () {},
                  ),
                  decoration: InputDecoration(
                    hintText: "Coloque aqui a descrição da aula...",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: kFormsGray, width: 2),
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
                          width: (size.height + size.width) / 3,
                          child: Text(
                            "Descrição resumida".toUpperCase(),
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 150,
                              color: KTextcolorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 3,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (value) => setState(
                              () {},
                            ),
                            decoration: InputDecoration(
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
                      ],
                    ),
                    Column(
                      // Valor Total
                      children: <Widget>[
                        SizedBox(
                          width: (size.height + size.width) / 8,
                          child: Text(
                            "Valor Total".toUpperCase(),
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 150,
                              color: KTextcolorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (size.height + size.width) / 8,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: KPrimaryColor,
                            onChanged: (value) => setState(
                              () {},
                            ),
                            decoration: InputDecoration(
                              hintText: "R\$00,00",
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
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: const <Widget>[LogoImage(width: 100)],
          )
        ],
      ),
    );
  }
}
