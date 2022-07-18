import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class Aboutbenefits extends StatelessWidget {
const Aboutbenefits({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Row(  
     children: [
       Text('O seu jeito de aprender!\n',
       style: TextStyle(
             fontSize: (size.height+size.width)/60,
             color: KPrimaryColor,
             fontWeight: FontWeight.bold
         )
       )
     ],
    );
  }
}

class Aboutbenefits2 extends StatelessWidget {
const Aboutbenefits2({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Row(
     children: [
        Text('Alunos e professores beneficiados com a liberdade de escolha dos melhores momentos, preços e áreas desejadas.',
        style: TextStyle(
             fontSize: (size.height+size.width)/160,
             color: KTextcolorLight,
             fontWeight: FontWeight.bold
         ),
        ),
     ],
    );
  }
}