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

    Teachers isabella = Teachers(
      nomeTutor: "Isabella",
      sobrenomeTutor: "Oliveira Espanhol",
      profissaoTutor: "Cientista de Dados - Itaú",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "Bella",
      nomeCurso: "MACHINE LEARNING",
      descricaoCursoResumida:
          "Aqui vou te ensinar sobre os principais algoritmos.",
      valorCurso: 150,
      categoria: category,
    );
    Teachers gabriel = Teachers(
        nomeTutor: "Gabriel",
        sobrenomeTutor: "Espanhol",
        profissaoTutor: "Arquiteto de Dados - Itaú",
        formacaoAcademica: "Sistemas de informações - FIAP",
        caminhoFoto: "gabriel",
        nomeCurso: "ARQUITETURA DE DADOS",
        descricaoCursoResumida:
            "Vou ensinar sobre as arquiteturas mais utilizadas.",
        valorCurso: 125,
        categoria: category,
        descricaoTutor:
            "Arquiteto de Dado com enfoque em administração de dados e Arquitetura de dados e sistemas. Atuação na orientação a equipe de desenvolvimento na utilização da técnica de modelagem de dados e padrões de nomenclatura, no uso de ferramentas case para elaboração de modelo de dados. Validação de modelos de dados elaborados pelos analistas de sistema analisando as regras de negócio dos sistemas bancários.");
    Teachers leonardo = Teachers(
      nomeTutor: "Leonado",
      sobrenomeTutor: "Mesquita",
      profissaoTutor: "Desenvolvedor - Loggi",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "leo1",
      nomeCurso: "ERP",
      descricaoCursoResumida:
          "Olá, você vai aprender os principais benefícios.",
      valorCurso: 100,
      categoria: category,
    );
    Teachers leonardo1 = Teachers(
      nomeTutor: "Leonardo",
      sobrenomeTutor: "Jordão",
      profissaoTutor: "Desenvolvedor - FIAP",
      formacaoAcademica: "Sistemas de informações - FIAP",
      caminhoFoto: "leo2",
      nomeCurso: "PYTHON BÁSICO",
      descricaoCursoResumida:
          "onsigo te mostrar o quão fácil é aprender esse tema",
      valorCurso: 50,
      categoria: category,
    );
    Teachers patrick = Teachers(
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
    );

    return Column(
      children: [
        MenuStudentSearch(title: category),
        Padding(
          padding: EdgeInsets.only(top: (size.height + size.width) / 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CourseCardView(teacher: isabella),
              CourseCardView(teacher: gabriel)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: (size.height + size.width) / 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CourseCardView(teacher: leonardo),
              CourseCardView(teacher: patrick)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: (size.height + size.width) / 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CourseCardView(teacher: leonardo1),
              CourseCardView(teacher: gabriel)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 70, top: 50, bottom: 50),
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
