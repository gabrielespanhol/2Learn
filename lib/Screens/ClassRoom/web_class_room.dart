import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/information_bar.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Screens/ClassRoom/components/chat_widget.dart';
import 'package:flutter_web_1/constant.dart';
import 'package:file_picker/file_picker.dart';

class WebClassRoom extends StatelessWidget {
  const WebClassRoom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15),
          child: informationBar(title: "nome da aula"),
        ),
        Container(
          width: (size.height + size.width) / 1.8,
          height: (size.height + size.width) / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 217, 217, 217),
          ),
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: (size.height + size.width) / 200,
                      top: (size.height + size.width) / 200,
                      bottom: (size.height + size.width) / 200,
                    ),
                    // aula aqui
                    child: Container(
                      width: (size.height + size.width) / 2.25,
                      height: (size.height + size.width) / 4.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: (size.height + size.width) / 9.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: (size.height + size.width) / 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Column(
                              children: [
                                PutSvgImage(
                                    width: (size.height + size.width) / 40,
                                    image: "assets/icons/file.svg"),
                                Text(
                                  'Arquivos',
                                  style: TextStyle(
                                    fontSize: (size.height + size.width) / 120,
                                    color: KTextcolor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans-Regular',
                                  ),
                                ),
                                GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: (size.height + size.width) / 340),
                                    child: Container(
                                      width: (size.height + size.width) / 30,
                                      height: (size.height + size.width) / 110,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize:
                                                (size.height + size.width) /
                                                    120,
                                            color: KTextcolor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans-Regular',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    final result =
                                        await FilePicker.platform.pickFiles();
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: (size.height + size.width) / 130),
                                  child: Container(
                                      width: (size.height + size.width) / 10,
                                      height: (size.height + size.width) / 5.8,
                                      child: ChatScreen()),
                                )
                              ],
                            ),
                            onTap: () => {},
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Column(
                    //       children: [
                    //         Padding(
                    //           padding: EdgeInsets.only(
                    //               left: (size.height + size.width) / 16),
                    //           child: PutSvgImage(
                    //               width: (size.height + size.width) / 60,
                    //               image: "assets/icons/chatIcon.svg"),
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.only(
                    //             bottom: (size.height + size.width) / 200,
                    //           ),
                    //           child: Container(
                    //             width: (size.height + size.width) / 10.5,
                    //             height: (size.height + size.width) / 70,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(8),
                    //               color:
                    //                   const Color.fromARGB(255, 255, 255, 255),
                    //             ),
                    //             child: Center(
                    //               child: Container(
                    //                 width: (size.height + size.width) / 12,
                    //                 height: (size.height + size.width) / 700,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   color: Colors.grey,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
