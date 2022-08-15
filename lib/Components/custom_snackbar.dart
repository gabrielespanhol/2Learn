import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackbar extends StatelessWidget {
  String? textoMensagem;
  Color? corPrimaria, corSecundaria;

  CustomSnackbar(
      {Key? key, this.textoMensagem, this.corPrimaria, this.corSecundaria})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 80,
              width: 300,
              decoration: BoxDecoration(
                  color: corPrimaria ?? Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.justify,
                      textoMensagem!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(15)),
                child: SvgPicture.asset(
                  "assets/icons/bubbles.svg",
                  height: 40,
                  width: 40,
                  color:
                      corSecundaria ?? const Color.fromARGB(255, 128, 18, 10),
                ),
              ),
            ),
            Positioned(
              top: -15,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/fail.svg",
                    height: 35,
                    width: 35,
                    color:
                        corSecundaria ?? const Color.fromARGB(255, 128, 18, 10),
                  ),
                  Positioned(
                    top: 10,
                    child: SvgPicture.asset(
                      "assets/icons/close.svg",
                      height: 15,
                      width: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
