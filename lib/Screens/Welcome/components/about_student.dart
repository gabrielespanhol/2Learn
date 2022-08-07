import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class AboutStudent extends StatelessWidget {
const AboutStudent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Column(
     children: [
       Row(
        children: [
          Text('PARA ALUNOS\n',
          style: TextStyle(
                fontSize: (size.height+size.width)/60,
                color: KPrimaryColor,
                fontWeight: FontWeight.bold,
                //fontFamily:'OpenSans',
            )
          )
        ],
       ),
       Row(
        children: [
           SizedBox(
            width: (size.height+size.width)/5.5,
             child: Text('A facilidade e poder de  escolha  que nós, estudantes, precisamos, de  acordo  com  nossas  necessidades, assuntos  de  interesse  e  capacidade  de  orçamento.\n\nAqui você escolhe o tutor que melhor atende o que você precisa, nos dias, horários e com o valor que cabe no seu bolso e que ficam igualmente bom para ele, de acordo com o definido.\n\nVocê pode agora ter o ensino voltado somente para você e suas necessidades, em aulas particulares, onde o tutor estará focado no seu desenvolvimento e saberá em primeira mão seu estágio atual para que haja progresso.\n\n',
             textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
             style: TextStyle(
                  fontSize: (size.height+size.width)/140,
                  color: KTextcolorLight,
                  fontFamily:'OpenSans',
              ),
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
                fontFamily:'OpenSans',
            ),),

            
        ],
       )
     ],
    );
  }
}