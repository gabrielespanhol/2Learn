import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class AboutUsText extends StatelessWidget {
const AboutUsText({ Key? key }) : super(key: key);

   @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
     children: [
       Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Text('Sobre nós\n',
          textAlign: TextAlign.start,
          style: TextStyle(
                fontSize: (size.height+size.width)/50,
                color: KTextcolor,
                fontWeight: FontWeight.bold
            )
          ),
        ],
       ),
       
     

        Row(
          children:  [
             Text('Somos uma empresa formada por um grupo de\nestudantes e amigos que viram uma necessidade no\nmeio em que vivemos.\n\nCom dificuldade em encontrar um serviço centrado\nem nossas necessidades de aprendizados\nparticulares.\n\nCom isso, formamos a 2Learn afim de ajudar\naqueles que, como nós, gostariam de ter a liberdade\nde escolher o que considera melhor e mais\nconfortável para si em um local seguro e confiável,\ncom a transparência de serviço que precisamos.\n\nBuscamos atender não somente os estudantes, mas\ntambém aqueles que com seu conhecimento\ndesejam ajudar o próximo e com isso ganhar uma\nrenda extra.',
            textAlign: TextAlign.justify,
            maxLines: 20,
             style: TextStyle(
                  fontSize: (size.height+size.width)/140,
                  color: KTextcolorLight,
                  fontWeight: FontWeight.bold
              )
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
