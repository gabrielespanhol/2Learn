import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/teachers.dart';
import 'package:flutter_web_1/Screens/StudentScreens/Components/menu_student_search.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/components/course_card_view.dart';

class WebViewCourses extends StatelessWidget {
  final String category;
  const WebViewCourses({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Teachers isabella = Teachers(
    //   nomeTutor: "Isabella",
    //   sobrenomeTutor: "Oliveira Espanhol",
    //   profissaoTutor: "Cientista de Dados - Itaú Unibanco",
    //   formacaoAcademica: "Sistemas de informações - FIAP",
    //   caminhoFoto: "Bella",
    //   nomeCurso: "MACHINE LEARNING",
    //   descricaoCursoResumida:
    //       "Aqui vou te ensinar sobre os principais algoritmos.",
    //   valorCurso: 150,
    //   categoria: category,
    //   numeroAulas: 4,
    //   tempoAula: 50,
    // );
    // Teachers gabriel = Teachers(
    //     nomeTutor: "Gabriel",
    //     sobrenomeTutor: "Espanhol",
    //     profissaoTutor: "Arquiteto de Dados - Itaú Unibanco",
    //     formacaoAcademica: "Sistemas de informações - FIAP",
    //     caminhoFoto: "gabriel",
    //     nomeCurso: "ARQUITETURA DE DADOS",
    //     descricaoCursoResumida:
    //         "Vou ensinar sobre as arquiteturas mais utilizadas.",
    //     valorCurso: 125,
    //     categoria: category,
    //     numeroAulas: 5,
    //     tempoAula: 40,
    //     descricaoCurso:
    //         "Sou Arquiteto de dados, meu objetivo é ensinar sobre as principais arquiteturas como: Data Mesh, Data Lake e Data Warehouse e sobre tecnicas de modelagem de banco de dados, relacionais,  noSQL e dimencionais. passando por modelagem conceitual, logica e fisica ",
    //     descricaoTutor:
    //         "Arquiteto de Dado com enfoque em administração de dados e Arquitetura de dados e sistemas. Atuação na orientação a equipe de desenvolvimento na utilização da técnica de modelagem de dados e padrões de nomenclatura, no uso de ferramentas case para elaboração de modelo de dados. Validação de modelos de dados elaborados pelos analistas de sistema analisando as regras de negócio dos sistemas bancários.");
    // Teachers leonardo = Teachers(
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
    //   categoria: category,
    //   numeroAulas: 7,
    // );
    // Teachers leonardo1 = Teachers(
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
    //   categoria: category,
    //   numeroAulas: 3,
    // );
    // Teachers patrick = Teachers(
    //   nomeTutor: "Patrick",
    //   sobrenomeTutor: "Aruda",
    //   profissaoTutor: "Desenvolvedor - Pupily",
    //   formacaoAcademica: "Sistemas de informações - FIAP",
    //   caminhoFoto: "patrick",
    //   nomeCurso: "TRATAMENTO DE DADOS",
    //   descricaoCursoResumida:
    //       "A ementa segue a linha das principais técnicas utilizadas.",
    //   valorCurso: 50,
    //   categoria: category,
    //   numeroAulas: 2,
    //   tempoAula: 40,
    // );

    // ignore: non_constant_identifier_names
    List<Teachers> TeachersList = [
      Teachers(
        nomeTutor: "Isabella",
        sobrenomeTutor: "Oliveira Espanhol",
        profissaoTutor: "Cientista de Dados - Itaú Unibanco",
        formacaoAcademica: "Sistemas de informações - FIAP",
        caminhoFoto: "Bella",
        nomeCurso: "MACHINE LEARNING",
        descricaoCursoResumida:
            "Aqui vou te ensinar sobre os principais algoritmos.",
        valorCurso: 150,
        categoria: category,
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
          categoria: category,
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
        categoria: category,
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
        categoria: category,
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
        categoria: category,
        numeroAulas: 2,
        tempoAula: 40,
      ),

      ///
      ///
      ///
      Teachers(
        nomeTutor: "Isabella",
        sobrenomeTutor: "Oliveira Espanhol",
        profissaoTutor: "Cientista de Dados - Itaú Unibanco",
        formacaoAcademica: "Sistemas de informações - FIAP",
        caminhoFoto: "Bella",
        nomeCurso: "MACHINE LEARNING",
        descricaoCursoResumida:
            "Aqui vou te ensinar sobre os principais algoritmos.",
        valorCurso: 150,
        categoria: category,
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
          categoria: category,
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
        categoria: category,
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
        categoria: category,
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
        categoria: category,
        numeroAulas: 2,
        tempoAula: 40,
      ),
    ];

    return Column(
      children: [
        MenuStudentSearch(title: category),
        SizedBox(
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
                child: CourseCardView(teacher: TeachersList[index]),
              );
            },
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: (size.height + size.width) / 55),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       CourseCardView(teacher: isabella),
        //       CourseCardView(teacher: gabriel)
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(top: (size.height + size.width) / 55),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       CourseCardView(teacher: leonardo),
        //       CourseCardView(teacher: patrick)
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(top: (size.height + size.width) / 55),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       CourseCardView(teacher: leonardo1),
        //       CourseCardView(teacher: gabriel)
        //     ],
        //   ),
        // ),
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
