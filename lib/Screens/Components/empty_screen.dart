import 'package:flutter/cupertino.dart';
import 'package:flutter_web_1/constant.dart';

class EmptyScreen extends StatelessWidget {
  final String texto;
  const EmptyScreen({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.height + size.width) / 1.7,
      height: (size.height + size.width) / 4,
      child: Center(
        child: Text(texto,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: (size.height + size.width) / 60,
              color: KPrimaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans-bold',
            )),
      ),
    );
  }
}
