import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/constant.dart';

// ignore: must_be_immutable
class MenuStudentSearch extends StatelessWidget {
  String? title;

  MenuStudentSearch({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  title!.toUpperCase(),
                  style: TextStyle(
                    fontSize: (size.height + size.width) / 60,
                    color: KPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans-bold',
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                PutSvgImage(
                  image: "assets/icons/search_icon.svg",
                  width: (size.height + size.width) / 70,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (size.height + size.width) / 250),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 470,
                  height: (size.height + size.width) / 50,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onSaved: (search) {},
                    decoration: const InputDecoration(
                      hintText:
                          "Venha ter a liberdade de construir seu próprio conhecimento",
                      border: OutlineInputBorder(),
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: (size.height + size.width) / 50),
            child: Column(
              children: <Widget>[
                PutSvgImage(
                  image: "assets/icons/logonImage.svg",
                  width: (size.height + size.width) / 60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
