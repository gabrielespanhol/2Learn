import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Controlers/Storage.dart';
import 'package:flutter_web_1/constant.dart';

// ignore: must_be_immutable
class MenuTeacher extends StatelessWidget {
  Storage storage = Storage();
  String? textoMenu, caminhofoto;

  MenuTeacher({Key? key, this.textoMenu, this.caminhofoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (size.height + size.width) / 40,
        vertical: (size.height + size.width) / 65,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '$textoMenu'.toUpperCase(),
                style: TextStyle(
                  fontSize: (size.height + size.width) / 60,
                  color: KPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans-bold',
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              FutureBuilder(
                  future: storage.downloadURL("$caminhofoto"),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Container(
                        width: (size.height + size.width) / 28,
                        height: (size.height + size.width) / 28,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            snapshot.data!,
                          ),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        !snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return PutSvgImage(
                      image: "assets/icons/logonImage.svg",
                      width: (size.height + size.width) / 50,
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
