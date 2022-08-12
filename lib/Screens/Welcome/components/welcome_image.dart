import 'package:flutter/material.dart';
import 'package:flutter_web_1/constant.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: (size.height + size.width) / 4.7,
                width: (size.height + size.width) / 4.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/gif_inicial.gif"),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Seu\naprendizado,\nsua escolha!",
                    style: TextStyle(
                        fontSize: (size.height + size.width) / 30,
                        color: KTextcolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
