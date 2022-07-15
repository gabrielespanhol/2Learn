import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class AboutUsStudent extends StatelessWidget {
const AboutUsStudent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Column(
     children: [
       Row(
        children: [
          Text('PARA ALUNOS\n',
          style: TextStyle(
                fontSize: (size.height+size.width)/45,
                color: KPrimaryColor,
                fontWeight: FontWeight.bold
            )
          )
        ],
       ),
       Row(
        children: [
           Text('A facilidade e poder de escolha que nós, estudantes,\nprecisamos, de acordo com nossas necessidades,\nassuntos de interesse e capacidade de orçamento.\n\nAqui você escolhe o tutor que melhor atende o que\nvocê precisa, nos dias, horários e com o valor que\ncabe no seu bolso e que ficam igualmente bom para\nele, de acordo com o definido.\n\nVocê pode agora ter o ensino voltado somente para\nvocê e suas necessidades, em aulas particulares,\nonde o tutor estará focado no seu desenvolvimento\ne saberá em primeira mão seu estágio atual para que\n haja progresso.\n\n',
           style: TextStyle(
                fontSize: (size.height+size.width)/140,
                color: KTextcolorLight,
                fontWeight: FontWeight.bold
            ),
           ),
        ],
       ),
       Row(
        children:[
          Text('\n\nVem com a gente!',
          style: TextStyle(
                fontSize: (size.height+size.width)/140,
                color: KTextcolorLight,
                fontWeight: FontWeight.bold
            ),),
        ],
       )
     ],
    );
  }
}