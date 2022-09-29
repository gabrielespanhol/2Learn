import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';

class TesteAlert extends StatefulWidget {
  @override
  _TesteAlertState createState() => _TesteAlertState();
}

class _TesteAlertState extends State<TesteAlert> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<DateTime> listDataTutor = [
    DateTime(2022, 9, 5),
    DateTime(2022, 9, 6),
  ];
  int numeroAulas = 4;
  List<DateTime> listdataAluno = [];

  int mostraCalendario = 1;

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: SizedBox(
                width: 400,
                height: 330,
                child: Column(
                  children: [
                    CleanCalendar(
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
                        if (listdataAluno.length >= numeroAulas) {
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
                    if (listdataAluno.length == numeroAulas)
                      {
                        setState(() {}),
                        DatabaseServices()
                            .createContractedClasses(listdataAluno)
                            .whenComplete(() {
                          setState(() {
                            listdataAluno.clear();
                            Navigator.of(context).pop();
                          });
                        }),
                        print("AULA ENVIADA")
                      }
                    else
                      {
                        print("AULA NÂO FOI ENVIADA"),
                      }
                  },
                  child: const Text("Enviar"),
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: TextButton(
          onPressed: () async {
            await showInformationDialog(context);
          },
          child: const Text(
              "Calendario aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
        )),
      ),
    );
  }
}
