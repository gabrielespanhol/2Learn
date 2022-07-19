import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_1/constant.dart';

class CardBenefits extends StatelessWidget {

  final String image;
  final String textDescripiton;
  
const CardBenefits({ Key? key, required this.image, required this.textDescripiton }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: (size.height+size.width)/9,
        height: (size.height+size.width)/6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: KPrimaryGrey,
         
        ),

        child: Column(
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                flex: 8,
                child: SvgPicture.asset(image, width: (size.height+size.width)/20),
              ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text(textDescripiton,
            style: TextStyle(
               fontSize: (size.height+size.width)/120,
               color: KPrimaryColor,
               
           ),
          ),
              ],
            ),
           
          ],
        )
      ),
    );
  }
}