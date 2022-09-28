import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class ImageEditing extends StatefulWidget {
  const ImageEditing({Key? key}) : super(key: key);

  @override
  _ImageEditingState createState() => _ImageEditingState();
}

class _ImageEditingState extends State<ImageEditing> {
  String nivel = "o";
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
          padding: EdgeInsets.only(
              bottom: (size.height + size.width) / 100,
              top: (size.height + size.width) / 100),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                height: (size.height + size.width) / 80,
                width: (size.height + size.width) / 29,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "EDITAR FOTO",
                    style: TextStyle(
                      color: KTextcolorLight,
                      fontSize: (size.height + size.width) / 230,
                      fontFamily: 'OpenSans-regular',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
