import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class AboutTeacher extends StatelessWidget {
  const AboutTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text('PARA TUTORES\n',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 60,
                  color: KPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans-bold',
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: (size.height + size.width) / 5.5,
              child: Text(
                  'A oportunidade de ajudar o próximo fazendo uma renda extra com isso, chegou!\n\nVocê agora poderá ajudar as pessoas com seus conhecimentos e fazer um orçamento que vá de acordo com a visão de valor do seu trabalho.\n\nPodendo escolher seus melhores momentos para estar colocando em prática as aulas com os tutorados, tendo uma plataforma única que te ajuda em toda a organização e segurança que precisa.\n\nAqui você encontra a liberdade de escolher exatamente o assunto que se sinta mais capacitado para compartilhar, de modo que possa criar aulas com assuntos de sua expertise.\n\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: (size.height + size.width) / 140,
                    color: KTextcolorLight,
                    fontFamily: 'OpenSans',
                  )),
            ),
          ],
        ),
        Row(
          children: [
            Text('Contamos com você!',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 140,
                  color: KTextcolorLight,
                  fontFamily: 'OpenSans',
                ))
          ],
        )
      ],
    );
  }
}
