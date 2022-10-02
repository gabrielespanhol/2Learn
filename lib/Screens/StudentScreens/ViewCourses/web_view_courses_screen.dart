import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/components/course_card_view.dart';
import 'package:flutter_web_1/constant.dart';

class WebViewCourses extends StatefulWidget {
  final String category;
  const WebViewCourses({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<WebViewCourses> createState() => _WebViewCoursesState();
}

class _WebViewCoursesState extends State<WebViewCourses> {
  var searchview = TextEditingController();

  bool firstSearch = true;
  late String query = "";

  late List<Classes> filterList;

  @override
  void initState() {
    super.initState();
    gettingClasses();
  }

  List<Classes> classesLists = [];
  String userName = "";

  AuthService authService = AuthService();

  String removerAcentosEspacos(String str) {
    var comAcento =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < comAcento.length; i++) {
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }

    str = str.replaceAll(" ", "");

    return str;
  }

  //  pegar classes pela categoria
  gettingClasses() async {
    if (widget.category.toLowerCase() == "geral") {
      await DatabaseServices().gettingClassesCategoryAll().then((snapshot) {
        setState(() {
          // retorna litsa de classes
          classesLists = snapshot;
        });
      });
    } else {
      await DatabaseServices()
          .gettingClassesCategory(
              removerAcentosEspacos(widget.category.toLowerCase()))
          .then((snapshot) {
        setState(() {
          // retorna litsa de classes
          classesLists = snapshot;
        });
      });
    }
  }

  _WebViewCoursesState() {
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

  Widget _performSearch() {
    filterList = <Classes>[];
    for (int i = 0; i < classesLists.length; i++) {
      var item = classesLists[i];

      if (item.className!.toLowerCase().contains(query.toLowerCase())) {
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
              child: CourseCardView(classes: filterList[index]));
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
        itemCount: classesLists.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (size.height + size.width) / 30,
                vertical: (size.height + size.width) / 95,
              ),
              child: CourseCardView(classes: classesLists[index]));
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  // List<Classes> classesLists = [
  // Teachers(
  //   nomeTutor: "Isabella",
  //   sobrenomeTutor: "Oliveira Queiroz Espanhol",
  //   profissaoTutor: "Cientista de Dados - Itaú Unibanco",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "Bella",
  //   nomeCurso: "MACHINE LEARNING",
  //   descricaoCursoResumida:
  //       "Aqui vou te ensinar sobre os principais algoritmos.",
  //   valorCurso: 150,
  //   categoria: "category",
  //   numeroAulas: 4,
  //   tempoAula: 50,
  // ),
  // Teachers(
  //     nomeTutor: "Gabriel",
  //     sobrenomeTutor: "Espanhol",
  //     profissaoTutor: "Arquiteto de Dados - Itaú Unibanco",
  //     formacaoAcademica: "Sistemas de informações - FIAP",
  //     caminhoFoto: "gabriel",
  //     nomeCurso: "ARQUITETURA DE DADOS",
  //     descricaoCursoResumida:
  //         "Vou ensinar sobre as arquiteturas mais utilizadas.",
  //     valorCurso: 125,
  //     categoria: "category",
  //     numeroAulas: 5,
  //     tempoAula: 40,
  //     descricaoCurso:
  //         "Sou Arquiteto de dados, meu objetivo é ensinar sobre as principais arquiteturas como: Data Mesh, Data Lake e Data Warehouse e sobre tecnicas de modelagem de banco de dados, relacionais,  noSQL e dimencionais. passando por modelagem conceitual, logica e fisica ",
  //     descricaoTutor:
  //         "Arquiteto de Dado com enfoque em administração de dados e Arquitetura de dados e sistemas. Atuação na orientação a equipe de desenvolvimento na utilização da técnica de modelagem de dados e padrões de nomenclatura, no uso de ferramentas case para elaboração de modelo de dados. Validação de modelos de dados elaborados pelos analistas de sistema analisando as regras de negócio dos sistemas bancários."),
  // Teachers(
  //   nomeTutor: "Leonado",
  //   sobrenomeTutor: "Mesquita",
  //   profissaoTutor: "Desenvolvedor - Loggi",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "leo1",
  //   nomeCurso: "ERP",
  //   descricaoCursoResumida:
  //       "Olá, você vai aprender os principais benefícios.",
  //   valorCurso: 100,
  //   tempoAula: 35,
  //   categoria: "category",
  //   numeroAulas: 7,
  // ),
  // Teachers(
  //   nomeTutor: "Leonardo",
  //   sobrenomeTutor: "Jordão",
  //   profissaoTutor: "Desenvolvedor - FIAP",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "leo2",
  //   nomeCurso: "PYTHON BÁSICO",
  //   descricaoCursoResumida:
  //       "onsigo te mostrar o quão fácil é aprender esse tema",
  //   valorCurso: 80,
  //   tempoAula: 30,
  //   categoria: "category",
  //   numeroAulas: 3,
  // ),
  // Teachers(
  //   nomeTutor: "Patrick",
  //   sobrenomeTutor: "Aruda",
  //   profissaoTutor: "Desenvolvedor - Pupily",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "patrick",
  //   nomeCurso: "TRATAMENTO DE DADOS",
  //   descricaoCursoResumida:
  //       "A ementa segue a linha das principais técnicas utilizadas.",
  //   valorCurso: 50,
  //   categoria: "category",
  //   numeroAulas: 2,
  //   tempoAula: 40,
  // ),

  // ///
  // ///
  // ///
  // Teachers(
  //   nomeTutor: "Isabella",
  //   sobrenomeTutor: "Oliveira Queiroz Espanhol",
  //   profissaoTutor: "Cientista de Dados - Itaú Unibanco",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "Bella",
  //   nomeCurso: "MACHINE LEARNING",
  //   descricaoCursoResumida:
  //       "Aqui vou te ensinar sobre os principais algoritmos.",
  //   valorCurso: 150,
  //   categoria: "category",
  //   numeroAulas: 4,
  //   tempoAula: 50,
  // ),
  // Teachers(
  //     nomeTutor: "Gabriel",
  //     sobrenomeTutor: "Espanhol",
  //     profissaoTutor: "Arquiteto de Dados - Itaú Unibanco",
  //     formacaoAcademica: "Sistemas de informações - FIAP",
  //     caminhoFoto: "gabriel",
  //     nomeCurso: "ARQUITETURA DE DADOS",
  //     descricaoCursoResumida:
  //         "Vou ensinar sobre as arquiteturas mais utilizadas.",
  //     valorCurso: 125,
  //     categoria: "category",
  //     numeroAulas: 5,
  //     tempoAula: 40,
  //     descricaoCurso:
  //         "Sou Arquiteto de dados, meu objetivo é ensinar sobre as principais arquiteturas como: Data Mesh, Data Lake e Data Warehouse e sobre tecnicas de modelagem de banco de dados, relacionais,  noSQL e dimencionais. passando por modelagem conceitual, logica e fisica ",
  //     descricaoTutor:
  //         "Arquiteto de Dado com enfoque em administração de dados e Arquitetura de dados e sistemas. Atuação na orientação a equipe de desenvolvimento na utilização da técnica de modelagem de dados e padrões de nomenclatura, no uso de ferramentas case para elaboração de modelo de dados. Validação de modelos de dados elaborados pelos analistas de sistema analisando as regras de negócio dos sistemas bancários."),
  // Teachers(
  //   nomeTutor: "Leonado",
  //   sobrenomeTutor: "Mesquita",
  //   profissaoTutor: "Desenvolvedor - Loggi",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "leo1",
  //   nomeCurso: "ERP",
  //   descricaoCursoResumida:
  //       "Olá, você vai aprender os principais benefícios.",
  //   valorCurso: 100,
  //   tempoAula: 35,
  //   categoria: "category",
  //   numeroAulas: 7,
  // ),
  // Teachers(
  //   nomeTutor: "Leonardo",
  //   sobrenomeTutor: "Jordão",
  //   profissaoTutor: "Desenvolvedor - FIAP",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "leo2",
  //   nomeCurso: "PYTHON BÁSICO",
  //   descricaoCursoResumida:
  //       "onsigo te mostrar o quão fácil é aprender esse tema",
  //   valorCurso: 80,
  //   tempoAula: 30,
  //   categoria: "category",
  //   numeroAulas: 3,
  // ),
  // Teachers(
  //   nomeTutor: "Patrick",
  //   sobrenomeTutor: "Aruda",
  //   profissaoTutor: "Desenvolvedor - Pupily",
  //   formacaoAcademica: "Sistemas de informações - FIAP",
  //   caminhoFoto: "patrick",
  //   nomeCurso: "TRATAMENTO DE DADOS",
  //   descricaoCursoResumida:
  //       "A ementa segue a linha das principais técnicas utilizadas.",
  //   valorCurso: 50,
  //   categoria: "category",
  //   numeroAulas: 2,
  //   tempoAula: 40,
  // ),
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        // MenuStudentSearch(title: widget.category),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      widget.category.toUpperCase(),
                      style: TextStyle(
                        fontSize: (size.height + size.width) / 60,
                        color: KPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-bold',
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget>[
                      PutSvgImage(
                        image: "assets/icons/search_icon.svg",
                        width: (size.height + size.width) / 70,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: (size.height + size.width) / 250),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 470,
                      height: (size.height + size.width) / 50,
                      child: TextFormField(
                        controller: searchview,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onSaved: (search) {},
                        decoration: const InputDecoration(
                          hintText:
                              "Venha ter a liberdade de construir seu próprio conhecimento",
                          border: OutlineInputBorder(),
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: (size.height + size.width) / 50),
                  child: Column(
                    children: <Widget>[
                      PutSvgImage(
                        image: "assets/icons/logonImage.svg",
                        width: (size.height + size.width) / 60,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4,
          child: firstSearch ? _createListView() : _performSearch(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 70, top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              LogoImage(width: 90),
            ],
          ),
        )
      ],
    );
  }
}
