// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:xpenso/BLoC/bloc_duration.dart';
import 'package:xpenso/main.dart';
import '../constans.dart';

final monthBloc = MonthBloc();
final dayBloc = DayBloc();
final yearBloc = YearBloc();

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
                    MyText(
                      content: '1206', // Total Income
                      color: cardFontColor,
                      size: cardFontSize + h05,
                      isHeader: true,
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
                    MyText(
                      content: '126', // Total Expense
                      color: cardFontColor,
                      size: cardFontSize + h05,
                      isHeader: true,
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
            ? dayBloc.eventSink.add(DayEvent.jump)
            : durationIndex == 1
                ? monthBloc.eventSink.add(MonthEvent.jump)
                : durationIndex == 2
                    ? yearBloc.eventSink.add(YearEvent.jump)
                    : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: DateTime.now(),
      stream: dayBloc.stateStream,
      builder: (context, snapshot) {
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
                                ? dayBloc.eventSink.add(DayEvent.minus)
                                : durationIndex == 1
                                    ? monthBloc.eventSink.add(MonthEvent.minus)
                                    : durationIndex == 2
                                        ? yearBloc.eventSink
                                            .add(YearEvent.minus)
                                        : null;
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
                      mainAxisAlignment: MainAxisAlignment.end,
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
                                  return MyText(
                                    content: day.format(snapshot.data!),
                                    isHeader: true,
                                    size: cardFontSize * 1.1,
                                  );
                                },
                              ),
                              StreamBuilder(
                                initialData: DateTime.now(),
                                stream: monthBloc.stateStream,
                                builder: (context, snapshot) {
                                  return MyText(
                                    content: month.format(snapshot.data!),
                                    isHeader: true,
                                    size: cardFontSize * 1.1,
                                  );
                                },
                              ),
                              StreamBuilder(
                                initialData: DateTime.now(),
                                stream: yearBloc.stateStream,
                                builder: (context, snapshot) {
                                  return MyText(
                                    content: year.format(snapshot.data!),
                                    isHeader: true,
                                    size: cardFontSize * 1.1,
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
                                ? dayBloc.eventSink.add(DayEvent.add)
                                : durationIndex == 1
                                    ? monthBloc.eventSink.add(MonthEvent.add)
                                    : durationIndex == 2
                                        ? yearBloc.eventSink.add(YearEvent.add)
                                        : null;
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
                          dayBloc.eventSink.add(DayEvent.jump0);
                          pickDate(context);
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
                  setState(() {
                    durationIndex = 0;
                  });
                  dayBloc.eventSink.add(DayEvent.jump0);
                  pageController.jumpToPage(0);
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
                  pageController.jumpToPage(1);
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
                  pageController.jumpToPage(2);
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
      },
    );
  }
}

//********************************* Expense Card Month  ************************/
class ExpenseCardMonth extends StatelessWidget {
  const ExpenseCardMonth({super.key});

  @override
  Widget build(BuildContext context) {
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
                      content: '12060', // Total Income
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
                      content: '1260', // Total Expense
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
}

//********************************* Expense Card Year  ************************/
class ExpenseCardYear extends StatelessWidget {
  const ExpenseCardYear({super.key});

  @override
  Widget build(BuildContext context) {
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
                      content: '1206000', // Total Income
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
                      content: '12060', // Total Expense
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
}
