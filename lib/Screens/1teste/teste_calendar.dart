import 'package:flutter/material.dart';
import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/constant.dart';

class TesteCalendar extends StatefulWidget {
  const TesteCalendar({Key? key}) : super(key: key);

  @override
  TesteCalendarState createState() => TesteCalendarState();
}

class TesteCalendarState extends State<TesteCalendar> {
  bool isloading = false;

  List<DateTime> listDataTutor = [
    DateTime(2022, 9, 5),
    DateTime(2022, 9, 6),
  ];
  int numeroAulas = 4;
  List<DateTime> listdataAluno = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Calendar"),
      ),
      body: Center(
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(
                  color: KPrimaryColor,
                ),
              )
            : SizedBox(
                width: 400,
                height: 600,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () => {
                          setState(() {
                            listdataAluno.clear();
                          }),
                        },
                        child: const Text("Limpar"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () => {
                          if (listdataAluno.length == numeroAulas)
                            {
                              setState(() {
                                isloading = true;
                              }),
                              DatabaseServices()
                                  .createContractedClasses(listdataAluno)
                                  .whenComplete(() {
                                setState(() {
                                  isloading = false;
                                  listdataAluno.clear();
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
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
