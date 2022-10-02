import 'package:clean_calendar/clean_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/custom_snackbar.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Components/put_sgv_image.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Controlers/storage.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Models/FinalModels/user.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/components/details_icon.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/components/request_course_botton.dart';
import 'package:flutter_web_1/constant.dart';

import '../Components/menu_student_search.dart';

// ignore: must_be_immutable
class WebCourseDetails extends StatefulWidget {
  Classes classes = Classes();
  WebCourseDetails({
    Key? key,
    required this.classes,
  }) : super(key: key);

  @override
  State<WebCourseDetails> createState() => _WebCourseDetailsState();
}

class _WebCourseDetailsState extends State<WebCourseDetails> {
  Storage storage = Storage();

  late int numeroAulass;

  List<DateTime> listDataTutor = [
    DateTime(2022, 10, 2),
    DateTime(2022, 10, 30),
    DateTime(2022, 10, 9),
    DateTime(2022, 10, 23),
    DateTime(2022, 10, 16),
    DateTime(2022, 10, 6),
  ];

  List<DateTime> listdataAluno = [];

  String givenClasses = "0";

  Users tutor = Users();
  Users aluno = Users();

  @override
  void initState() {
    super.initState();
    gettingUserDataTutor();
    gettingUserDataAluno();
    numeroAulass = int.parse(widget.classes.numberClasses!);
  }

  gettingUserDataTutor() async {
    try {
      await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
          .getUserData(widget.classes.tutorId.toString())
          .then((snapshot) {
        setState(() {
          tutor = snapshot[0];
        });
      });
    } catch (e) {
      return null;
    }
  }

  gettingUserDataAluno() async {
    try {
      await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
          .getUserData(FirebaseAuth.instance.currentUser!.uid)
          .then((snapshot) {
        setState(() {
          print(FirebaseAuth.instance.currentUser!.uid);
          aluno = snapshot[0];
        });
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var valorCurso = widget.classes.valueClasses.toString();
    var numeroAulas = widget.classes.numberClasses.toString();
    var tempoAula = widget.classes.durationClasses.toString();

    return Column(
      children: [
        MenuStudentSearch(
          title: widget.classes.category.toString(),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: (size.height + size.width) / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: (size.height + size.width) / 20,
                    height: (size.height + size.width) / 64,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(
                          (size.height + size.width) / 100),
                    ),
                    child: Center(
                      child: Text(
                        'Tutor'.toUpperCase(),
                        style: TextStyle(
                          fontSize: (size.height + size.width) / 100,
                          color: KTextcolorLight,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans-bold',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: (size.height + size.width) / 20,
                    height: (size.height + size.width) / 64,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(
                          (size.height + size.width) / 100),
                    ),
                    child: Center(
                      child: Text(
                        'Aulas'.toUpperCase(),
                        style: TextStyle(
                          fontSize: (size.height + size.width) / 100,
                          color: KTextcolorLight,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans-bold',
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: (size.height + size.width) / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: (size.height + size.width) / 15,
                      width: (size.height + size.width) / 15,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(200),
                      //   image: DecorationImage(
                      //       image:
                      //           AssetImage("assets/tutores/$caminhoFoto.png"),
                      //       fit: BoxFit.cover),
                      // ),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          if (tutor.level == "b")
                            Container(
                              width: (size.height + size.width) / 15,
                              height: (size.height + size.width) / 15,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/bronze.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          if (tutor.level == "p")
                            Container(
                              width: (size.height + size.width) / 15,
                              height: (size.height + size.width) / 15,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/prata.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          if (tutor.level == "o")
                            Container(
                              width: (size.height + size.width) / 15,
                              height: (size.height + size.width) / 15,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/ouro.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                (size.height + size.width)),
                            child: Container(
                              width: (size.height + size.width) / 17,
                              height: (size.height + size.width) / 17,
                              child: FutureBuilder(
                                future: storage.downloadURL("${tutor.uid}.png"),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData) {
                                    return SizedBox(
                                      width: (size.height + size.width) / 28,
                                      height: (size.height + size.width) / 28,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          tutor.name.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                        Text(
                          tutor.lastName.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      tutor.profession.toString(),
                      style: TextStyle(
                        fontSize: (size.height + size.width) / 140,
                        color: KTextcolor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-regular',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Formação: ",
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                        Text(
                          tutor.academicFormation.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: (size.height + size.width) / 6,
                          child: Text(
                            tutor.personalDescription.toString(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 140,
                              color: KTextcolor,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // risco do meio

              Container(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 1500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 185, 184, 184),
                ),
              ),

              // outra parta da descrição

              SizedBox(
                height: (size.height + size.width) / 4,
                width: (size.height + size.width) / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          widget.classes.className.toString(),
                          style: TextStyle(
                            fontSize: (size.height + size.width) / 140,
                            color: KTextcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-regular',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: (size.height + size.width) / 4,
                          child: Text(
                            textAlign: TextAlign.justify,
                            widget.classes.description.toString(),
                            style: TextStyle(
                              fontSize: (size.height + size.width) / 140,
                              color: KTextcolor,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    ),

                    // container cinsa com o numero de aula, valor da aula etc
                    Row(
                      children: <Widget>[
                        Container(
                          height: (size.height + size.width) / 13,
                          width: (size.height + size.width) / 4,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  DetailsIcon(
                                      image: "assets/images/book.png",
                                      text:
                                          "$numeroAulas Aulas                 "),
                                  DetailsIcon(
                                      image: "assets/images/money.png",
                                      text: "R\$ $valorCurso (Completo)"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  const DetailsIcon(
                                      image: "assets/images/idea.png",
                                      text: "Conteúdos adicionais         "),
                                  DetailsIcon(
                                      image: "assets/images/clock.png",
                                      text:
                                          "$tempoAula min - Horário à combinar"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // logo + botão de solicitar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            decoration: BoxDecoration(
                                color: KPrimaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "Solicitar".toUpperCase(),
                              style: const TextStyle(
                                  color: KTextcolorLight,
                                  fontSize: 20,
                                  fontFamily: 'OpenSans-bold',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () async {
                            await showInformationDialog(context);
                          },
                        ),
                        LogoImage(width: (size.height + size.width) / 25),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: SizedBox(
                width: 400,
                height: 330,
                child: Column(
                  children: [
                    CleanCalendar(
                      startDateOfCalendar: DateTime(2022, 10, 2),
                      monthsSymbol: const Months(
                          january: "Janeiro",
                          february: "Fevereiro",
                          march: "Março",
                          april: "Abril",
                          may: "Maio",
                          june: "Junho",
                          july: "Julho",
                          august: "Agosto",
                          september: "Setembro",
                          october: "Outubro",
                          november: "Novembro",
                          december: "Dezembro"),

                      weekdaysSymbol: const Weekdays(
                          sunday: "D",
                          monday: "S",
                          tuesday: "T",
                          wednesday: "Q",
                          thursday: "Q",
                          friday: "S",
                          saturday: "S"),

                      enableDenseViewForDates:
                          true, // <- Set false to allow button boundary to expand.
                      enableDenseSplashForDates:
                          false, // <- Set true to minimise tap target.
                      //datePickerCalendarView: ,

                      dateSelectionMode: DatePickerSelectionMode.single,

                      onSelectedDates: (List<DateTime> selectedDates) {
                        // Called every time dates are selected or deselected.

                        // limta o numero de dias selecionados
                        if (listdataAluno.length >= numeroAulass) {
                          setState(() {});
                        } else {
                          setState(() {
                            listdataAluno.add(selectedDates[0]);
                          });
                        }
                      },
                      selectedDates: listDataTutor + listdataAluno,
                    ),
                  ],
                ),
              ),
              title: const Text('AGENDAR AULA'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      listdataAluno.clear();
                    }),
                  },
                  child: const Text("Limpar"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        listdataAluno.clear();
                        Navigator.of(context).pop();
                      }),
                    },
                    child: const Text("Cancelar"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    print(listdataAluno),
                    if (listdataAluno.length == numeroAulass)
                      {
                        setState(() {}),
                        DatabaseServices()
                            .createContractedClasses(
                          givenClasses,
                          widget.classes.className!,
                          widget.classes.numberClasses!,
                          widget.classes.category!,
                          listdataAluno,
                          aluno.uid!,
                          aluno.userSex!,
                          aluno.name!,
                          tutor.name!,
                          tutor.userSex!,
                          tutor.uid!,
                        )
                            .whenComplete(() {
                          setState(() {
                            listdataAluno.clear();
                            // Navigator.of(context).pop();
                          });
                        }),
                        Navigator.pushNamed(
                          context,
                          "/cursosContratados",
                        ),
                        snackBarSuccessContrataCurso(),
                      }
                    else
                      {
                        snackBarErroCurso(),
                      }
                  },
                  child: const Text("Enviar"),
                ),
              ],
            );
          });
        });
  }

  snackBarSuccessContrataCurso() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: CustomSnackbar(
          textoMensagem: "Aula contrada com sucesso",
          corPrimaria: Colors.green,
          corSecundaria: const Color.fromARGB(255, 64, 148, 67),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  snackBarErroCurso() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: CustomSnackbar(
          textoMensagem:
              "Selecione mais ${numeroAulass - listdataAluno.length} dias",
          corPrimaria: Colors.red,
          corSecundaria: Color.fromARGB(255, 150, 30, 22),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
