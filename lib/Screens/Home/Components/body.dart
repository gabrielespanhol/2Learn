// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Row(
      children: [
        SizedBox(
          height: (size.height+size.width)/3.5,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
               Container(
                height: (size.height+size.width)/4.7,
                width: (size.height+size.width)/4.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/gif_inicial.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
                
                  child: Center(
                    child: Text(
                      "Seu\naprendizado,\nsua escolha!",
                      style: TextStyle(
                        fontSize: (size.height+size.width)/30,
                        color: KTextcolor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
               ),    
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Center(
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: (size.height+size.width)/50,
                        color: KTextcolor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
               ) ,    
            ],     
        ),
      ],
    );
  }
}