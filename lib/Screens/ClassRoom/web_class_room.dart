import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Screens/ClassRoom/components/chat_widget.dart';
import 'package:flutter_web_1/constant.dart';

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
              //color: KTextcolor,
              //color: const Color.fromARGB(255, 217, 217, 217),
              color: const Color.fromARGB(255, 100, 100, 100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Stack(
                          children: [
                            Center(
                              child: PutSvgImage(
                                width: (size.height + size.width) / 8,
                                image: "assets/icons/camera2.svg",
                              ),
                            ),
                          ],
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
