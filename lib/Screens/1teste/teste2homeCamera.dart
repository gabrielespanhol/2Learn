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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          if (mostraCamera)
            if (cameraController.value.isInitialized)
              SizedBox(
                height: 600,
                width: 600,
                child: CameraPreview(cameraController),
              ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                mostraCamera = true;
                setState(() {});
              },
              child: const Text('Launch Camera'),
            ),
          ),
        ],
      ),
    );
  }
}
