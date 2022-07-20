import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class AboutUsTeacher extends StatelessWidget {
const AboutUsTeacher({ Key? key }) : super(key: key);

   @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Column(
     children: [
       Row(
        children:  [
          Text('PARA TUTORES\n',
          style: TextStyle(
                fontSize: (size.height+size.width)/45,
                color: KPrimaryColor,
                fontWeight: FontWeight.bold
            )
          ),
        ],
       ),
       Row(
        children:  [
           Text('A oportunidade de ajudar o próximo fazendo uma\nrenda extra com isso, chegou!\n\nVocê agora poderá ajudar as pessoas com seus\nconhecimentos e fazer um orçamento que vá de\nacordo com a visão de valor do seu trabalho.\n\nPodendo escolher seus melhores momentos para\nestar colocando em prática as aulas com os\ntutorados, tendo uma plataforma única que te ajuda\nem toda a organização e segurança que precisa.\n\nAqui você encontra a liberdade de escolher\nexatamente o assunto que se sinta mais capacitado\npara compartilhar, de modo que possa criar aulas\ncom assuntos de sua expertise.\n\n',
           textAlign: TextAlign.justify,
           style: TextStyle(
                fontSize: (size.height+size.width)/140,
                color: KTextcolorLight,
                fontWeight: FontWeight.bold
            )
          ),
    
        ],
       ),
       Row(
        children: [
          Text('Contamos com você!',
          style: TextStyle(
                fontSize: (size.height+size.width)/140,
                color: KTextcolorLight,
                fontWeight: FontWeight.bold
            ))
        ],
       )
     ],
    );
  }
}