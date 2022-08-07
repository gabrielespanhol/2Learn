import 'package:flutter/material.dart';

import '../constant.dart';

class CopyRightBottom extends StatelessWidget {
  const CopyRightBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[

        Row(
       children: <Widget>[
           
                Container(
                   width: (size.height+size.width)/2,
                   height: 3,
                   decoration: const BoxDecoration(
                     color: Color.fromARGB(255, 216, 215, 215)
                   ),
                 ),
             
       ],
     ),
     Row(
       children: [
         Text('SIGA-NOS\n',
               style: TextStyle(
                     fontSize: (size.height+size.width)/60,
                     color: KPrimaryColor,
                     fontWeight: FontWeight.bold,
                     //fontFamily:'OpenSans',
                 )
               ),
       ],
     ), 
      ],
    );
  }
}