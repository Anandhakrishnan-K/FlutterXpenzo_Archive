// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:xpenso/BLoC/bloc_day_update.dart';
import 'package:xpenso/BLoC/bloc_duration.dart';
import 'package:xpenso/BLoC/bloc_month.dart';
import 'package:xpenso/BLoC/year_bloc.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/main.dart';
import 'package:xpenso/utils/month_list.dart';
import 'package:xpenso/utils/year_list.dart';

class ExpenseCard extends StatefulWidget {
  final Function()? onPressedCredit;
  final Function()? onPressedDebit;
  const ExpenseCard(
      {super.key, required this.onPressedCredit, required this.onPressedDebit});

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  void dispose() {
    debugPrint('Day Expense card Dispose Method: State Killed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: cardHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(h15),
            color: appBarColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: h05,
                offset: Offset(0, h05),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
//********************************* Income  **********************************/
            Column(
              children: [
                SizedBox(
                  height: h25,
                ),
                MyText(
                  content: 'Total Income',
                  color: cardFontColor,
                  size: cardFontSize,
                ),
                SizedBox(
                  height: h20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: cardFontColor,
                      size: cardFontSize + h05,
                    ),
                    SizedBox(
                      width: h05,
                    ),
                    StreamBuilder(
                      stream: dayTotalCreditBloc.stateStream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        int tmp = snapshot.data!;
                        return MyText(
                          content: tmp.toString(), // Total Income
                          color: cardFontColor,
                          size: cardFontSize + h05,
                          isHeader: true,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: h10,
                ),
//********************************* Add Crediit Button ************************/
                MyButton(
                    content: 'Add Credit',
                    fillColor: transparent,
                    borderColor: transparent,
                    textcolor: cardFontColor,
                    textSize: cardFontSize,
                    height: h50,
                    onPressed: widget.onPressedCredit)
              ],
            ),
            VerticalDivider(
              color: Colors.white,
              thickness: 1,
              indent: h25,
              endIndent: h25,
            ),
//********************************* Expense  **********************************/
            Column(
              children: [
                SizedBox(
                  height: h25,
                ),
                MyText(
                  content: 'Total Expense',
                  color: cardFontColor,
                  size: cardFontSize,
                ),
                SizedBox(
                  height: h20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: cardFontColor,
                      size: cardFontSize + h05,
                    ),
                    SizedBox(
                      width: h05,
                    ),
                    StreamBuilder(
                      stream: dayTotalDebitBloc.stateStream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        int tmp = snapshot.data!;
                        return MyText(
                          content: tmp.toString(), // Total Income
                          color: cardFontColor,
                          size: cardFontSize + h05,
                          isHeader: true,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: h10,
                ),
//********************************* Add Debit Button ************************/
                MyButton(
                    content: 'Add Debit',
                    fillColor: transparent,
                    borderColor: transparent,
                    textcolor: cardFontColor,
                    textSize: cardFontSize,
                    height: h50,
                    onPressed: widget.onPressedDebit)
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ));
  }
}

//************************* Duration card SStartes here *****************/
class DurationCard extends StatefulWidget {
  const DurationCard({super.key});
  @override
  State<DurationCard> createState() => _DurationCardState();
}

class _DurationCardState extends State<DurationCard> {
  Future pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        durationIndex == 0
            ? {
                dayBloc.eventSink.add(DayEvent.jump),
                dayUpdateBloc.eventSink.add(DayUpdate.update),
                dayTotalCreditBloc.eventSink.add(DayUpdate.credit),
                dayTotalDebitBloc.eventSink.add(DayUpdate.debit)
              }
            : durationIndex == 1
                ? {
                    monthBloc.eventSink.add(MonthEvent.jump),
                    monthTotalListBloc.eventSink.add(MonthUpdate.update),
                    monthTotalBloc.eventSink.add(MonthUpdate.getdata),
                  }
                : durationIndex == 2
                    ? {
                        yearBloc.eventSink.add(YearEvent.jump),
                        yearUpadteBloc.eventSink.add(YearUpdate.update),
                        yearTotalBloc.eventSink.add(YearUpdate.getData),
                      }
                    : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tabHeight,
      width: deviceWidth,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h15),
                color: appBarColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: h05,
                    offset: Offset(0, h05),
                  )
                ]),
            width: deviceWidth * 0.5,
            height: tabHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: w10,
                ),
                //********************************* Minus Button ************************/
                SizedBox(
                  width: w50,
                  child: IconButton(
                      onPressed: () {
                        durationIndex == 0
                            ? {
                                dayBloc.eventSink.add(DayEvent.minus),
                                dayUpdateBloc.eventSink.add(DayUpdate.update),
                                dayTotalCreditBloc.eventSink
                                    .add(DayUpdate.credit),
                                dayTotalDebitBloc.eventSink.add(DayUpdate.debit)
                              }
                            : durationIndex == 1
                                ? {
                                    monthBloc.eventSink.add(MonthEvent.minus),
                                    monthTotalListBloc.eventSink
                                        .add(MonthUpdate.update),
                                    monthTotalBloc.eventSink
                                        .add(MonthUpdate.getdata),
                                  }
                                : durationIndex == 2
                                    ? {
                                        yearBloc.eventSink.add(YearEvent.minus),
                                        yearUpadteBloc.eventSink
                                            .add(YearUpdate.update),
                                        yearTotalBloc.eventSink
                                            .add(YearUpdate.getData),
                                      }
                                    : null;
                        // dayUpdateBloc.eventSink.add(DayUpdate.update);
                        // dayTotalCreditBloc.eventSink.add(DayUpdate.credit);
                        // dayTotalDebitBloc.eventSink.add(DayUpdate.debit);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: w50,
                        weight: h05,
                      )),
                ),
                SizedBox(
                  width: w25,
                ),
                //********************************* Duration Text Box ************************/
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h50,
                      width: w100 * 2,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: durationController,
                        children: [
                          StreamBuilder(
                            initialData: DateTime.now(),
                            stream: dayBloc.stateStream,
                            builder: (context, snapshot) {
                              date = snapshot.data!;
                              return Center(
                                child: MyText(
                                  content: day.format(date),
                                  isHeader: true,
                                  size: cardFontSize * 1.1,
                                ),
                              );
                            },
                          ),
                          StreamBuilder(
                            initialData: DateTime.now(),
                            stream: monthBloc.stateStream,
                            builder: (context, snapshot) {
                              date = snapshot.data!;
                              return Center(
                                child: MyText(
                                  content: month.format(date),
                                  isHeader: true,
                                  size: cardFontSize * 1.1,
                                ),
                              );
                            },
                          ),
                          StreamBuilder(
                            initialData: DateTime.now(),
                            stream: yearBloc.stateStream,
                            builder: (context, snapshot) {
                              date = snapshot.data!;
                              return Center(
                                child: MyText(
                                  content: year.format(date),
                                  isHeader: true,
                                  size: cardFontSize * 1.1,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //********************************* Plus Button ************************/
                SizedBox(
                  width: w50,
                  child: IconButton(
                      onPressed: () {
                        durationIndex == 0
                            ? {
                                dayBloc.eventSink.add(DayEvent.add),
                                dayUpdateBloc.eventSink.add(DayUpdate.update),
                                dayTotalCreditBloc.eventSink
                                    .add(DayUpdate.credit),
                                dayTotalDebitBloc.eventSink.add(DayUpdate.debit)
                              }
                            : durationIndex == 1
                                ? {
                                    monthBloc.eventSink.add(MonthEvent.add),
                                    monthTotalListBloc.eventSink
                                        .add(MonthUpdate.update),
                                    monthTotalBloc.eventSink
                                        .add(MonthUpdate.getdata),
                                  }
                                : durationIndex == 2
                                    ? {
                                        yearBloc.eventSink.add(YearEvent.add),
                                        yearUpadteBloc.eventSink
                                            .add(YearUpdate.update),
                                        yearTotalBloc.eventSink
                                            .add(YearUpdate.getData),
                                      }
                                    : null;
                        // dayUpdateBloc.eventSink.add(DayUpdate.update);
                        // dayTotalCreditBloc.eventSink.add(DayUpdate.credit);
                        // dayTotalDebitBloc.eventSink.add(DayUpdate.debit);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: w50,
                      )),
                ),
                SizedBox(
                  width: w05,
                ),
                //********************************* Calendar Button ************************/
                IconButton(
                    onPressed: () {
                      pickDate(context);
                      durationIndex == 0
                          ? {
                              dayBloc.eventSink.add(DayEvent.jump0),
                              dayUpdateBloc.eventSink.add(DayUpdate.update),
                              dayTotalCreditBloc.eventSink
                                  .add(DayUpdate.credit),
                              dayTotalDebitBloc.eventSink.add(DayUpdate.debit)
                            }
                          : durationIndex == 1
                              ? {
                                  monthTotalListBloc.eventSink
                                      .add(MonthUpdate.update),
                                  monthTotalBloc.eventSink
                                      .add(MonthUpdate.getdata),
                                }
                              : durationIndex == 2
                                  ? {
                                      yearUpadteBloc.eventSink
                                          .add(YearUpdate.update),
                                      yearTotalBloc.eventSink
                                          .add(YearUpdate.getData),
                                    }
                                  : null;

                      // dayUpdateBloc.eventSink.add(DayUpdate.update);
                      // dayTotalCreditBloc.eventSink.add(DayUpdate.credit);
                      // dayTotalDebitBloc.eventSink.add(DayUpdate.debit);
                    },
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      size: h25 + h05,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: h20,
          ),
          //********************************* Day Switch Button ************************/
          MyButton(
            fillColor: transparent,
            borderColor: transparent,
            textcolor: durationIndex == 0 ? appBarColor : Colors.black,
            isBold: true,
            content: 'D',
            onPressed: () {
              dayBloc.eventSink.add(DayEvent.jump0);
              durationIndex == 0
                  ? {
                      dayUpdateBloc.eventSink.add(DayUpdate.update),
                      dayTotalCreditBloc.eventSink.add(DayUpdate.credit),
                      dayTotalDebitBloc.eventSink.add(DayUpdate.debit),
                    }
                  : null;
              setState(() {
                durationIndex = 0;
              });
              pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.decelerate);
              durationController.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            height: h50,
            width: h50,
            textSize: durationIndex == 0 ? h25 : h20,
          ),
          SizedBox(
            width: h20,
          ),
          //********************************* Month Switch Button ************************/
          MyButton(
            fillColor: transparent,
            borderColor: transparent,
            textcolor: durationIndex == 1 ? appBarColor : Colors.black,
            isBold: true,
            content: 'M',
            onPressed: () {
              setState(() {
                durationIndex = 1;
              });
              monthBloc.eventSink.add(MonthEvent.jump0);
              monthTotalListBloc.eventSink.add(MonthUpdate.update);

              monthTotalBloc.eventSink.add(MonthUpdate.getdata);
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.decelerate);
              durationController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            height: h50,
            width: h50,
            textSize: durationIndex == 1 ? h25 : h20,
          ),
          SizedBox(
            width: h20,
          ),
          //********************************* Year Switch Button ************************/
          MyButton(
            fillColor: transparent,
            borderColor: transparent,
            textcolor: durationIndex == 2 ? appBarColor : Colors.black,
            isBold: true,
            content: 'Y',
            onPressed: () {
              setState(() {
                durationIndex = 2;
              });
              yearBloc.eventSink.add(YearEvent.jump0);
              yearUpadteBloc.eventSink.add(YearUpdate.update);
              yearTotalBloc.eventSink.add(YearUpdate.getData);
              pageController.animateToPage(2,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.decelerate);
              durationController.animateToPage(2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            height: h50,
            width: h50,
            textSize: durationIndex == 2 ? h25 : h20,
          ),
        ],
      ),
    );
  }
}

//********************************* Expense Card Month  ************************/
class ExpenseCardMonth extends StatefulWidget {
  const ExpenseCardMonth({super.key});

  @override
  State<ExpenseCardMonth> createState() => _ExpenseCardMonthState();
}

class _ExpenseCardMonthState extends State<ExpenseCardMonth> {
  @override
  void initState() {
    super.initState();
    monthTotalBloc.eventSink.add(MonthUpdate.getdata);
    debugPrint('From Month Expense Card Initstate: State Initiated');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: tmpCredit,
        stream: monthTotalBloc.statestream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MapEntry<DateTime, MapEntry<int, int>>> temp = snapshot.data!;
            tmpCredit = temp;
            return Container(
                height: cardHeight1,
                width: deviceWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(h15),
                    color: appBarColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: h05,
                        offset: Offset(0, h05),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    //********************************* Income  **********************************/
                    Column(
                      children: [
                        SizedBox(
                          height: h25,
                        ),
                        MyText(
                          content: 'Total Income',
                          color: cardFontColor,
                          size: cardFontSize,
                        ),
                        SizedBox(
                          height: h20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              color: cardFontColor,
                              size: cardFontSize + h05,
                            ),
                            SizedBox(
                              width: h05,
                            ),
                            MyText(
                              content:
                                  temp[0].value.key.toString(), // Total Income
                              color: cardFontColor,
                              size: cardFontSize + h05,
                              isHeader: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      indent: h25,
                      endIndent: h25,
                    ),
                    //********************************* Expense  **********************************/
                    Column(
                      children: [
                        SizedBox(
                          height: h25,
                        ),
                        MyText(
                          content: 'Total Expense',
                          color: cardFontColor,
                          size: cardFontSize,
                        ),
                        SizedBox(
                          height: h20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              color: cardFontColor,
                              size: cardFontSize + h05,
                            ),
                            SizedBox(
                              width: h05,
                            ),
                            MyText(
                              content: temp[0]
                                  .value
                                  .value
                                  .toString(), // Total Expense
                              color: cardFontColor,
                              size: cardFontSize + h05,
                              isHeader: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ));
          }
          return const MyText(content: 'Loading');
        });
  }
}

//********************************* Expense Card Year  ************************/
class ExpenseCardYear extends StatefulWidget {
  const ExpenseCardYear({super.key});

  @override
  State<ExpenseCardYear> createState() => _ExpenseCardYearState();
}

class _ExpenseCardYearState extends State<ExpenseCardYear> {
  @override
  void initState() {
    super.initState();
    yearTotalBloc.eventSink.add(YearUpdate.getData);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: tmpCredit,
        stream: yearTotalBloc.stateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MapEntry<DateTime, MapEntry<int, int>>> yearTotal =
                snapshot.data!;
            return Container(
                height: cardHeight1,
                width: deviceWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(h15),
                    color: appBarColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: h05,
                        offset: Offset(0, h05),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    //********************************* Income  **********************************/
                    Column(
                      children: [
                        SizedBox(
                          height: h25,
                        ),
                        MyText(
                          content: 'Total Income',
                          color: cardFontColor,
                          size: cardFontSize,
                        ),
                        SizedBox(
                          height: h20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              color: cardFontColor,
                              size: cardFontSize + h05,
                            ),
                            SizedBox(
                              width: h05,
                            ),
                            MyText(
                              content: yearTotal[0]
                                  .value
                                  .key
                                  .toString(), // Total Income
                              color: cardFontColor,
                              size: cardFontSize + h05,
                              isHeader: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      indent: h25,
                      endIndent: h25,
                    ),
                    //********************************* Expense  **********************************/
                    Column(
                      children: [
                        SizedBox(
                          height: h25,
                        ),
                        MyText(
                          content: 'Total Expense',
                          color: cardFontColor,
                          size: cardFontSize,
                        ),
                        SizedBox(
                          height: h20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              color: cardFontColor,
                              size: cardFontSize + h05,
                            ),
                            SizedBox(
                              width: h05,
                            ),
                            MyText(
                              content: yearTotal[0]
                                  .value
                                  .value
                                  .toString(), // Total Expense
                              color: cardFontColor,
                              size: cardFontSize + h05,
                              isHeader: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ));
          }
          return const MyText(content: 'Loading');
        });
  }
}
