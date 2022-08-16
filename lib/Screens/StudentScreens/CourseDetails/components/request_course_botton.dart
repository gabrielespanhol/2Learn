import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/constant.dart';

class RequestCourseBotton extends StatelessWidget {
  const RequestCourseBotton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
              color: KPrimaryColor, borderRadius: BorderRadius.circular(15)),
          child: Text(
            "Solicitar".toUpperCase(),
            style: const TextStyle(
                color: KTextcolorLight,
                fontSize: 20,
                fontFamily: 'OpenSans-bold',
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: CustomSnackbar(
                textoMensagem: "Solicitação enviada",
                corPrimaria: Colors.green,
                corSecundaria: const Color.fromARGB(255, 64, 148, 67),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        },
      ),
    );
  }
}
