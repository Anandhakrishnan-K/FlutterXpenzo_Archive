// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:xpenso/BLoC/bloc_day_update.dart';
import 'package:xpenso/BLoC/bloc_duration.dart';
import 'package:xpenso/DataBase/data_model.dart';
import 'package:xpenso/DataBase/db_connnection.dart';
import 'package:xpenso/utils/add_expenses.dart';
import 'package:xpenso/utils/day_list.dart';
import 'package:xpenso/utils/month_list.dart';
import 'package:xpenso/utils/tabs.dart';
import 'constans.dart';
import 'utils/year_list.dart';

//Creating BLoC Objects
final monthBloc = MonthBloc();
final dayBloc = DayBloc();
final yearBloc = YearBloc();
final dayUpdateBloc = DayUpdateBloc();
final dayTotalCreditBloc = DayTotalCreditBloc();
final dayTotalDebitBloc = DayTotalDebitBloc();

//Referencing Service
final service = Services();

//Function for Getting Data
String dayDay = d.format(dateSelected).toString();
String monthDay = m.format(dateSelected).toString();
String yearDay = y.format(dateSelected).toString();

// Main Program Starts here
PageController pageController = PageController();
PageController durationController = PageController();
final MaterialColor colorPrimary = MaterialColor(
  0xFF91C8FF,
  const <int, Color>{
    50: Color(0xFFE9F2F9),
    100: Color(0xFFC8DDEE),
    200: Color(0xFFA2C2E2),
    300: Color(0xFF7BA7D6),
    400: Color(0xFF5B92CC),
    500: Color(0xFF3B7DBF),
    600: Color(0xFF3475B8),
    700: Color(0xFF2B6BAC),
    800: Color(0xFF2361A1),
    900: Color(0xFF174F8E),
  },
);

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(
        primarySwatch: colorPrimary,
        highlightColor: transparent,
        splashColor: transparent,
        focusColor: transparent),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // getDayData() async {
  //   debugPrint('Calling Inside Home Page');
  //   dayData.clear();
  //   var data = await service.getData(dayDay, monthDay, yearDay);
  //   data.forEach((ledger) {
  //     setState(() {
  //       var dataModel = Ledger();
  //       dataModel.id = ledger['id'];
  //       dataModel.amount = ledger['amount'];
  //       dataModel.notes = ledger['notes'];
  //       dataModel.categoryIndex = ledger['categoryIndex'];
  //       dataModel.categoryFlag = ledger['categoryFlag'] == 1 ? true : false;
  //       dataModel.day = ledger['day'];
  //       dataModel.month = ledger['month'];
  //       dataModel.year = ledger['year'];
  //       dataModel.createdT = ledger['createdT'];
  //       dataModel.attachmentFlag = ledger['attachmentFlag'] == 1 ? true : false;
  //       dataModel.attachmentName = ledger['attachmentName'];

  //       dayData.add(dataModel);
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    debugPrint('Home Page Initiated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: MyText(
          content: 'XpenZo',
          size: h25,
          isHeader: true,
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: h10,
            ),
//******************************** Duration Card *******************************/
            DurationCard(),
            SizedBox(
              height: h15,
            ),
            SizedBox(
              height: cardHeight + listHeight + h10,
              width: deviceWidth,
              child: PageView(
                // Page View Starts Here
                physics: NeverScrollableScrollPhysics(),

                controller: pageController,
                children: [
                  Column(
                    children: [
//******************************** Main Page - Day ****************************/
                      SizedBox(
                        height: cardHeight,
                        child: ExpenseCard(
//******************************* Adding Credit Buttton ************************/
                          onPressedCredit: () {
                            setState(() {
                              selectedIndex1 = List.filled(30, false);
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(h20),
                                        topRight: Radius.circular(h20))),
                                isDismissible: false,
                                isScrollControlled: true,
                                elevation: h25,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: AddCredit(
                                        iscredit: true,
                                        list: incomeList,
                                        submitButtonName: 'Add credit / Income',
                                        onPressed: () async {
                                          Ledger ledger = Ledger();
                                          ledger.amount =
                                              int.parse(amountController.text);
                                          ledger.notes = notesController.text;
                                          ledger.categoryFlag = true;
                                          ledger.categoryIndex = catIndex;
                                          ledger.day =
                                              d.format(dateSelected).toString();
                                          ledger.month =
                                              m.format(dateSelected).toString();
                                          ledger.year =
                                              y.format(dateSelected).toString();
                                          ledger.createdT =
                                              DateTime.now().toString();
                                          ledger.attachmentFlag = false;
                                          ledger.attachmentName = 'NA';
                                          Navigator.pop(context);
                                          var result =
                                              await service.saveData(ledger);
                                          dayUpdateBloc.eventSink
                                              .add(DayUpdate.update);
                                          dayTotalCreditBloc.eventSink
                                              .add(DayUpdate.credit);
                                          dayTotalDebitBloc.eventSink
                                              .add(DayUpdate.debit);
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.white,
                                                  dismissDirection:
                                                      DismissDirection
                                                          .endToStart,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  content: MyText(
                                                    content:
                                                        'Credit Amount: ${ledger.amount} added successfully',
                                                    size: cardFontSize,
                                                  )));
                                          debugPrint(
                                              '${result.toString()} added to the list | amount: ${ledger.amount} | day: ${ledger.day}');
                                        },
                                      ));
                                },
                              );
                            });
                          },
//******************************* Adding Debit Buttton ************************/
                          onPressedDebit: () {
                            setState(() {
                              selectedIndex1 = List.filled(30, false);
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(h20),
                                        topRight: Radius.circular(h20))),
                                isDismissible: false,
                                isScrollControlled: true,
                                elevation: h25,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: AddCredit(
                                      iscredit: false,
                                      list: expenseList,
                                      submitButtonName: 'Add Debit / Expense',
                                      onPressed: () async {
                                        Ledger ledger = Ledger();
                                        ledger.amount =
                                            int.parse(amountController.text);
                                        ledger.notes = notesController.text;
                                        ledger.categoryFlag = false;
                                        ledger.categoryIndex = catIndex;
                                        ledger.day =
                                            d.format(dateSelected).toString();
                                        ledger.month =
                                            m.format(dateSelected).toString();
                                        ledger.year =
                                            y.format(dateSelected).toString();
                                        ledger.createdT =
                                            DateTime.now().toString();
                                        ledger.attachmentFlag = false;
                                        ledger.attachmentName = 'NA';
                                        Navigator.pop(context);
                                        var result =
                                            await service.saveData(ledger);
                                        dayUpdateBloc.eventSink
                                            .add(DayUpdate.update);
                                        dayTotalCreditBloc.eventSink
                                            .add(DayUpdate.credit);
                                        dayTotalDebitBloc.eventSink
                                            .add(DayUpdate.debit);
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.white,
                                                dismissDirection:
                                                    DismissDirection.endToStart,
                                                duration:
                                                    const Duration(seconds: 1),
                                                content: MyText(
                                                  content:
                                                      'Debit Amount: ${ledger.amount} added successfully',
                                                  size: cardFontSize,
                                                )));
                                        debugPrint(
                                            '${result.toString()} added to the list | amount: ${ledger.amount} | day: ${ledger.day}');
                                      },
                                    ),
                                  );
                                },
                              );
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: h10,
                      ),
                      SizedBox(
                        height: listHeight,
                        child: ListBuilder(),
                      )
                    ],
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
//******************************** Main Page - Month **************************/
                      SizedBox(height: cardHeight1, child: ExpenseCardMonth()),
                      SizedBox(
                        height: h10,
                      ),
                      SizedBox(
                        height: listHeight + h50,
                        child: MonthList(),
                      )
                    ],
                  ),
                  Column(
//******************************** Main Page - Year ***************************/
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(height: cardHeight1, child: ExpenseCardYear()),
                      SizedBox(
                        height: h10,
                      ),
                      SizedBox(
                        height: listHeight + h50,
                        child: YearList(),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
