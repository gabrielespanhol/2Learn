import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';

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
           
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Container(
                     width: (size.height+size.width)/2,
                     height: 3,
                     decoration: const BoxDecoration(
                       color: Color.fromARGB(255, 216, 215, 215)
                     ),
                   ),
                ),
             
       ],
     ),
     Row(
      mainAxisAlignment: MainAxisAlignment.start,
       children: [
         SizedBox(
          width: (size.height+size.width)/2,
           child: Text('SIGA-NOS\n',
                 style: TextStyle(
                       fontSize: (size.height+size.width)/60,
                       color: KPrimaryColor,
                       fontWeight: FontWeight.bold,
                       //fontFamily:'OpenSans',
                   )
                 ),
         ),
       ],
     ), 

     SizedBox(
      width: (size.height+size.width)/2,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
         children: <Widget>[
           LogoImage(width: (size.height+size.width)/25),
         ],
       ),
     ),

     Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
        Column(
          children: [
            Container(
                    height: (size.height+size.width)/120,
                    width: (size.height+size.width)/100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/copyright.png"),
                        
                      ))),
          ],
        ),
        Column(
          
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, top: (size.height+size.width)/130),
              child: Text('2Learn, all rights reserved\n',
                   style: TextStyle(
                         fontSize: (size.height+size.width)/150,
                         color: KTextcolor,
                         fontWeight: FontWeight.bold,
                         fontFamily:'OpenSans',
                     )
                   ),
            ),
          ],
        )
       ],
     )
      ],
    );
  }
}