// ignore_for_file: unnecessary_newHomeTesteLista3

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/teachers.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/components/course_card_view.dart';

//Represents the HomeTesteLista3page widget
class HomeTesteLista3 extends StatefulWidget {
  //`createState()` will create the mutable state for this widget at
  //a given location in the tree.
  @override
  _HomeTesteLista3State createState() => _HomeTesteLista3State();
}

//Our HomeTesteLista3 state, the logic and internal state for a StatefulWidget.
class _HomeTesteLista3State extends State<HomeTesteLista3> {
  //A controller for an editable text field.
  //Whenever the user modifies a text field with an associated
  //TextEditingController, the text field updates value and the
  //controller notifies its listeners.
  var searchview = TextEditingController();

  bool firstSearch = true;
  late String query = "";

  late List<Teachers> filterList;

  @override
  // ignore: must_call_super
  void initState() {}

  final String category = "";

  List<Teachers> TeachersList = [
    Teachers(
      nomeTutor: "Isabella",
      sobrenomeTutor: "Oliveira Queiroz Espanhol",
      profissaoTutor: "Cientista de Dados - Itaú Unibanco",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "Bella",
      nomeCurso: "MACHINE LEARNING",
      descricaoCursoResumida:
          "Aqui vou te ensinar sobre os principais algoritmos.",
      valorCurso: 150,
      categoria: "category",
      numeroAulas: 4,
      tempoAula: 50,
    ),
    Teachers(
        nomeTutor: "Gabriel",
        sobrenomeTutor: "Espanhol",
        profissaoTutor: "Arquiteto de Dados - Itaú Unibanco",
        formacaoAcademica: "Sistemas de informações - FIAP",
        caminhoFoto: "gabriel",
        nomeCurso: "ARQUITETURA DE DADOS",
        descricaoCursoResumida:
            "Vou ensinar sobre as arquiteturas mais utilizadas.",
        valorCurso: 125,
        categoria: "category",
        numeroAulas: 5,
        tempoAula: 40,
        descricaoCurso:
            "Sou Arquiteto de dados, meu objetivo é ensinar sobre as principais arquiteturas como: Data Mesh, Data Lake e Data Warehouse e sobre tecnicas de modelagem de banco de dados, relacionais,  noSQL e dimencionais. passando por modelagem conceitual, logica e fisica ",
        descricaoTutor:
            "Arquiteto de Dado com enfoque em administração de dados e Arquitetura de dados e sistemas. Atuação na orientação a equipe de desenvolvimento na utilização da técnica de modelagem de dados e padrões de nomenclatura, no uso de ferramentas case para elaboração de modelo de dados. Validação de modelos de dados elaborados pelos analistas de sistema analisando as regras de negócio dos sistemas bancários."),
    Teachers(
      nomeTutor: "Leonado",
      sobrenomeTutor: "Mesquita",
      profissaoTutor: "Desenvolvedor - Loggi",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "leo1",
      nomeCurso: "ERP",
      descricaoCursoResumida:
          "Olá, você vai aprender os principais benefícios.",
      valorCurso: 100,
      tempoAula: 35,
      categoria: "category",
      numeroAulas: 7,
    ),
    Teachers(
      nomeTutor: "Leonardo",
      sobrenomeTutor: "Jordão",
      profissaoTutor: "Desenvolvedor - FIAP",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "leo2",
      nomeCurso: "PYTHON BÁSICO",
      descricaoCursoResumida:
          "onsigo te mostrar o quão fácil é aprender esse tema",
      valorCurso: 80,
      tempoAula: 30,
      categoria: "category",
      numeroAulas: 3,
    ),
    Teachers(
      nomeTutor: "Patrick",
      sobrenomeTutor: "Aruda",
      profissaoTutor: "Desenvolvedor - Pupily",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "patrick",
      nomeCurso: "TRATAMENTO DE DADOS",
      descricaoCursoResumida:
          "A ementa segue a linha das principais técnicas utilizadas.",
      valorCurso: 50,
      categoria: "category",
      numeroAulas: 2,
      tempoAula: 40,
    ),

    ///
    ///
    ///
    Teachers(
      nomeTutor: "Isabella",
      sobrenomeTutor: "Oliveira Queiroz Espanhol",
      profissaoTutor: "Cientista de Dados - Itaú Unibanco",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "Bella",
      nomeCurso: "MACHINE LEARNING",
      descricaoCursoResumida:
          "Aqui vou te ensinar sobre os principais algoritmos.",
      valorCurso: 150,
      categoria: "category",
      numeroAulas: 4,
      tempoAula: 50,
    ),
    Teachers(
        nomeTutor: "Gabriel",
        sobrenomeTutor: "Espanhol",
        profissaoTutor: "Arquiteto de Dados - Itaú Unibanco",
        formacaoAcademica: "Sistemas de informações - FIAP",
        caminhoFoto: "gabriel",
        nomeCurso: "ARQUITETURA DE DADOS",
        descricaoCursoResumida:
            "Vou ensinar sobre as arquiteturas mais utilizadas.",
        valorCurso: 125,
        categoria: "category",
        numeroAulas: 5,
        tempoAula: 40,
        descricaoCurso:
            "Sou Arquiteto de dados, meu objetivo é ensinar sobre as principais arquiteturas como: Data Mesh, Data Lake e Data Warehouse e sobre tecnicas de modelagem de banco de dados, relacionais,  noSQL e dimencionais. passando por modelagem conceitual, logica e fisica ",
        descricaoTutor:
            "Arquiteto de Dado com enfoque em administração de dados e Arquitetura de dados e sistemas. Atuação na orientação a equipe de desenvolvimento na utilização da técnica de modelagem de dados e padrões de nomenclatura, no uso de ferramentas case para elaboração de modelo de dados. Validação de modelos de dados elaborados pelos analistas de sistema analisando as regras de negócio dos sistemas bancários."),
    Teachers(
      nomeTutor: "Leonado",
      sobrenomeTutor: "Mesquita",
      profissaoTutor: "Desenvolvedor - Loggi",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "leo1",
      nomeCurso: "ERP",
      descricaoCursoResumida:
          "Olá, você vai aprender os principais benefícios.",
      valorCurso: 100,
      tempoAula: 35,
      categoria: "category",
      numeroAulas: 7,
    ),
    Teachers(
      nomeTutor: "Leonardo",
      sobrenomeTutor: "Jordão",
      profissaoTutor: "Desenvolvedor - FIAP",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "leo2",
      nomeCurso: "PYTHON BÁSICO",
      descricaoCursoResumida:
          "onsigo te mostrar o quão fácil é aprender esse tema",
      valorCurso: 80,
      tempoAula: 30,
      categoria: "category",
      numeroAulas: 3,
    ),
    Teachers(
      nomeTutor: "Patrick",
      sobrenomeTutor: "Aruda",
      profissaoTutor: "Desenvolvedor - Pupily",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "patrick",
      nomeCurso: "TRATAMENTO DE DADOS",
      descricaoCursoResumida:
          "A ementa segue a linha das principais técnicas utilizadas.",
      valorCurso: 50,
      categoria: "category",
      numeroAulas: 2,
      tempoAula: 40,
    ),
  ];

  _HomeTesteLista3State() {
    //Register a closure to be called when the object changes.
    searchview.addListener(() {
      if (searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          firstSearch = true;
          query = "";
        });
      } else {
        setState(() {
          firstSearch = false;
          query = searchview.text;
        });
      }
    });
  }

  //Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: searchview,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

//
// vamos ver se vai aqui
//
// teste gridDelegate
  Widget _performSearch() {
    filterList = <Teachers>[];
    for (int i = 0; i < TeachersList.length; i++) {
      var item = TeachersList[i];

      if (item.nomeCurso!.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.height + size.width) / 1.7,
      height: (size.height + size.width) / 4,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: (size.height + size.width) / 11,
        ),
        itemCount: filterList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (size.height + size.width) / 30,
                vertical: (size.height + size.width) / 95,
              ),
              child: CourseCardView(teacher: filterList[index]));
        },
      ),
    );
  }

  Widget _createListView() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.height + size.width) / 1.7,
      height: (size.height + size.width) / 4,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: (size.height + size.width) / 11,
        ),
        itemCount: TeachersList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (size.height + size.width) / 30,
                vertical: (size.height + size.width) / 95,
              ),
              child: CourseCardView(teacher: TeachersList[index]));
        },
      ),
    );
  }

  //Build our HomeTesteLista3 widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text("SearchView ListView"),
      ),
      body: new Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
    );
  }
}
