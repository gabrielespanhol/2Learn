import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Controlers/storage.dart';
import 'package:flutter_web_1/Models/user.dart';
import 'package:flutter_web_1/constant.dart';

// ignore: must_be_immutable
class MenuTeacher extends StatefulWidget {
  String? textoMenu, caminhofoto;

  MenuTeacher({Key? key, this.textoMenu, this.caminhofoto}) : super(key: key);

  @override
  State<MenuTeacher> createState() => _MenuTeacherState();
}

class _MenuTeacherState extends State<MenuTeacher> {
  Storage storage = Storage();

  String nivel = "o";

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  Users tutor = Users();
  gettingUserData() async {
    try {
      await DatabaseServices()
          .getUserData(FirebaseAuth.instance.currentUser!.uid)
          .then((snapshot) {
        setState(() {
          tutor = snapshot[0];
        });
      });
    } catch (e) {
      return null;
    }
  }

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
                '${widget.textoMenu}'.toUpperCase(),
                style: TextStyle(
                  decoration: TextDecoration.none,
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
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  if (tutor.level == "b")
                    Container(
                      width: (size.height + size.width) / 28,
                      height: (size.height + size.width) / 28,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bronze.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  if (tutor.level == "p")
                    Container(
                      width: (size.height + size.width) / 28,
                      height: (size.height + size.width) / 28,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/prata.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  if (tutor.level == "o")
                    Container(
                      width: (size.height + size.width) / 28,
                      height: (size.height + size.width) / 28,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/ouro.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular((size.height + size.width)),
                    child: Container(
                      width: (size.height + size.width) / 32,
                      height: (size.height + size.width) / 32,
                      child: FutureBuilder(
                        future: storage.downloadURL('${widget.caminhofoto}'),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return SizedBox(
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
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting &&
                              !snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return PutSvgImage(
                            image: "assets/icons/logonImage.svg",
                            width: (size.height + size.width) / 50,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
