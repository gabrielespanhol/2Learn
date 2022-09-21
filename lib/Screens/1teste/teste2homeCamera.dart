import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class testeCamera extends StatefulWidget {
  testeCamera({Key? key}) : super(key: key);

  @override
  State<testeCamera> createState() => _testeCameraState();
}

class _testeCameraState extends State<testeCamera> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

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

//   @override
//   Widget build(BuildContext context) {
//     if (cameraController.value.isInitialized) {
//       return Center(
//         child: Stack(
//           children: <Widget>[
//             SizedBox(
//               height: 600,
//               width: 600,
//               child: CameraPreview(cameraController),
//             ),
//           ],
//         ),
//       );
//     } else {
//       return SizedBox();
//     }
//   }
// }

  bool mostraCamera = false;
  bool abremicro = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            if (mostraCamera)
              if (cameraController.value.isInitialized)
                SizedBox(
                  height: 600,
                  width: 600,
                  child: CameraPreview(cameraController),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (mostraCamera == false)
                  IconButton(
                    icon: const Icon(Icons.videocam),
                    iconSize: 50,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      mostraCamera = true;
                      setState(() {});
                    },
                  ),
                if (mostraCamera)
                  IconButton(
                    icon: const Icon(Icons.videocam_off),
                    iconSize: 50,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      mostraCamera = false;
                      setState(() {});
                    },
                  ),
                // teste microfone
                if (abremicro == false)
                  IconButton(
                    icon: const Icon(Icons.mic),
                    iconSize: 50,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      abremicro = true;
                      setState(() {});
                    },
                  ),
                if (abremicro)
                  IconButton(
                    icon: const Icon(Icons.mic_off),
                    iconSize: 50,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      abremicro = false;
                      setState(() {});
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
