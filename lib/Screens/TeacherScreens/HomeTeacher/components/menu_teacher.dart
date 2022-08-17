import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class MenuTeacher extends StatelessWidget {
  String? nome, caminhofoto;

  MenuTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'SEJA BEM-VINDO DE VOLTA, $nome!'.toUpperCase(),
                style: TextStyle(
                  fontSize: (size.height + size.width) / 60,
                  color: KPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans-bold',
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learn-731c0.appspot.com/o/gabriel.png?alt=media&token=6f657bfa-c5a2-4d44-9548-e141198eb159")
            ],
          )
        ],
      ),
    );
  }
}
