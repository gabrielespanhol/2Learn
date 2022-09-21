import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Screens/ClassRoom/components/chat_widget.dart';

class WebClassRoom extends StatefulWidget {
  final String nomeAula;
  const WebClassRoom({
    Key? key,
    required this.nomeAula,
  }) : super(key: key);

  @override
  State<WebClassRoom> createState() => _WebClassRoomState();
}

class _WebClassRoomState extends State<WebClassRoom> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

// metodo para startar a camera
  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  bool abreCamera = false;
  bool abreMicro = true;
  bool compartilaTela = true;
  Color coloricons = Colors.white;
  double iconSize = 40;

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
                            if (abreCamera)
                              if (cameraController.value.isInitialized)
                                SizedBox(
                                  width: size.width -
                                      50 -
                                      ((size.height + size.width) / 9.4),
                                  height: size.height - 43,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: CameraPreview(cameraController),
                                  ),
                                ),

                            // linhas com os componetes de camera/microfone/compatilhar tela
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 100, 100, 100),
                                        width: 0,
                                        style: BorderStyle.solid),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 100, 100, 100),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      // aqui abre a camera
                                      if (abreCamera == false)
                                        IconButton(
                                          icon: const Icon(Icons.videocam_off),
                                          iconSize: iconSize,
                                          color: coloricons,
                                          onPressed: () async {
                                            abreCamera = true;
                                            setState(() {});
                                          },
                                        ),
                                      // aqui fecha a camera
                                      if (abreCamera)
                                        IconButton(
                                          icon: const Icon(Icons.videocam),
                                          iconSize: iconSize,
                                          color: coloricons,
                                          onPressed: () async {
                                            startCamera();
                                            abreCamera = false;
                                            setState(() {});
                                          },
                                        ),
                                      //  microfone
                                      if (abreMicro == false)
                                        IconButton(
                                          icon: const Icon(Icons.mic),
                                          iconSize: iconSize,
                                          color: coloricons,
                                          onPressed: () async {
                                            abreMicro = true;
                                            setState(() {});
                                          },
                                        ),
                                      if (abreMicro)
                                        IconButton(
                                          icon: const Icon(Icons.mic_off),
                                          iconSize: iconSize,
                                          color: coloricons,
                                          onPressed: () async {
                                            abreMicro = false;
                                            setState(() {});
                                          },
                                        ),
                                      //  compartilhar tela
                                      if (compartilaTela == false)
                                        IconButton(
                                          icon: const Icon(
                                              Icons.screen_share_outlined),
                                          iconSize: iconSize,
                                          color: coloricons,
                                          onPressed: () async {
                                            compartilaTela = true;
                                            setState(() {});
                                          },
                                        ),
                                      if (compartilaTela)
                                        IconButton(
                                          icon: const Icon(
                                              Icons.stop_screen_share_outlined),
                                          iconSize: iconSize,
                                          color: coloricons,
                                          onPressed: () async {
                                            compartilaTela = false;
                                            setState(() {});
                                          },
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            )
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
                                        widget.nomeAula.toUpperCase(),
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
