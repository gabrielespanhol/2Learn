import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/information_bar.dart';

class WebClassRoom extends StatelessWidget {
  const WebClassRoom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15),
          child: informationBar(title: "nome da aula"),
        ),
        Container(
          width: (size.height + size.width) / 1.8,
          height: (size.height + size.width) / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 217, 217, 217),
          ),
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: (size.height + size.width) / 200,
                      top: (size.height + size.width) / 200,
                      bottom: (size.height + size.width) / 200,
                    ),
                    child: Container(
                      width: (size.height + size.width) / 2.3,
                      height: (size.height + size.width) / 4.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[],
              )
            ],
          ),
        ),
      ],
    );
  }
}
