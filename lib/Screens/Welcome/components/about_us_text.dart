import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

import '../../../Components/default_button.dart';

class AboutUsText extends StatelessWidget {
  const AboutUsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: (size.height + size.width) / 5,
          child: Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Sobre nós\n',
                    style: TextStyle(
                      fontSize: (size.height + size.width) / 60,
                      color: KTextcolor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans-bold',
                    )),
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: (size.height + size.width) / 5,
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      'Somos uma empresa formada por um grupo de estudantes e amigos que viram uma necessidade no meio em que vivemos.\n\nCom dificuldade em encontrar um serviço centrado em nossas necessidades de aprendizados particulares.\n\nCom isso, formamos a ',
                  style: TextStyle(
                    fontSize: (size.height + size.width) / 140,
                    color: KTextcolorLight,
                    fontFamily: 'OpenSans',
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: '2Learn ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                        text:
                            'afim de ajudar aqueles que, como nós, gostariam de ter a liberdade de escolher o que considera melhor e mais confortável para si em um local seguro e confiável, com a transparência de serviço que precisamos.\n\nBuscamos atender não somente os estudantes, mas também aqueles que com seu conhecimento desejam ajudar o próximo e com isso ganhar uma renda extra.'),
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              '\n\nVem com a gente!',
              style: TextStyle(
                fontSize: (size.height + size.width) / 140,
                color: KTextcolorLight,
                fontFamily: 'OpenSans',
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: DefaultButton(text: "Cadastre-se", press: "/cadastro"),
            ),
          ],
        )
      ],
    );
  }
}
