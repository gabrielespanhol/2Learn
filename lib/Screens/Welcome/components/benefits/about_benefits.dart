import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class Aboutbenefits extends StatelessWidget {
  const Aboutbenefits({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: (size.height + size.width) / 3,
          child: Align(
            alignment: Alignment.topRight,
            child: Row(
              children: [
                Text('O seu jeito de aprender!\n',
                    style: TextStyle(
                      fontSize: (size.height + size.width) / 60,
                      color: KPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans-bold',
                    ))
              ],
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: (size.height + size.width) / 3,
              child: Text(
                'Alunos e professores beneficiados com a liberdade de escolha dos melhores momentos, preços e áreas desejadas.',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 160,
                  color: KTextcolorLight,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
