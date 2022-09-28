import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class ImageEditing extends StatefulWidget {
  const ImageEditing({Key? key}) : super(key: key);

  @override
  _ImageEditingState createState() => _ImageEditingState();
}

class _ImageEditingState extends State<ImageEditing> {
  String nivel = "b";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            if (nivel == "b")
              Container(
                width: (size.height + size.width) / 13,
                height: (size.height + size.width) / 13,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bronze.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            if (nivel == "p")
              Container(
                width: (size.height + size.width) / 13,
                height: (size.height + size.width) / 13,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/prata.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            if (nivel == "o")
              Container(
                width: (size.height + size.width) / 13,
                height: (size.height + size.width) / 13,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ouro.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular((size.height + size.width)),
              child: Container(
                width: (size.height + size.width) / 14.5,
                height: (size.height + size.width) / 14.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/tutores/Bella.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: (size.height + size.width) / 80),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                height: (size.height + size.width) / 60,
                width: (size.height + size.width) / 14,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Editar imagem",
                  style: TextStyle(
                      color: KTextcolorLight,
                      fontSize: 18,
                      fontFamily: 'OpenSans-bold',
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
