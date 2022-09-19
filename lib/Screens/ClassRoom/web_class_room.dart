import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/ClassRoom/components/chat_widget.dart';

class WebClassRoom extends StatelessWidget {
  final String nomeAula;
  const WebClassRoom({
    Key? key,
    required this.nomeAula,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: size.width - 20,
            height: size.height - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              //color: kSecondaryColor,
              color: const Color.fromARGB(255, 217, 217, 217),
              //color: Color.fromRGBO(97, 95, 163, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: (size.height + size.width) / 270),
                      // aula aqui
                      child: Container(
                        width: size.width -
                            50 -
                            ((size.height + size.width) / 9.4),
                        height: size.height - 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),

                // parte do lado direiro chat + arquivos
                SizedBox(
                  width: (size.height + size.width) / 9.5,
                  height: size.height - 50,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                // tamanho do arquivo e botão para adicionar arquivos
                                height: (size.height + size.width) / 45,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: (size.height + size.width) / 9.5,
                                      child: Text(
                                        nomeAula.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              (size.height + size.width) / 120,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans-Regular',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: (size.height + size.width) / 9.5,
                                height: size.height -
                                    50 -
                                    (size.height + size.width) / 45,
                                child: ChatScreen(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
