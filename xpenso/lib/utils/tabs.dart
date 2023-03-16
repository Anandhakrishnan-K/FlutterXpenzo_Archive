// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:xpenso/main.dart';
import '../constans.dart';

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
            child: Row(
              children: [
                SizedBox(
                  width: w25,
                ),
//********************************* Minus Button ************************/
                SizedBox(
                  width: h25,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          durationIndex == 0
                              ? date =
                                  DateTime(date.year, date.month, date.day - 1)
                              : durationIndex == 1
                                  ? date = DateTime(
                                      date.year, date.month - 1, date.day)
                                  : date = DateTime(
                                      date.year - 1, date.month, date.day);
                          days = DateTime(date.year, date.month + 1, 0).day;
                        });
                        debugPrint(days.toString());
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: h15,
                        weight: h05,
                      )),
                ),
                SizedBox(
                  width: h05,
                ),
//********************************* Duration Text Box ************************/
                SizedBox(
                  width: h100,
                  child: Center(
                    child: MyText(
                      content: durationIndex == 0
                          ? day.format(date)
                          : durationIndex == 1
                              ? month.format(date)
                              : year.format(date),
                      isHeader: true,
                      size: cardFontSize * 1.1,
                    ),
                  ),
                ),
//********************************* Plus Button ************************/
                SizedBox(
                  width: h25,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          durationIndex == 0
                              ? date =
                                  DateTime(date.year, date.month, date.day + 1)
                              : durationIndex == 1
                                  ? date = DateTime(
                                      date.year, date.month + 1, date.day)
                                  : date = DateTime(
                                      date.year + 1, date.month, date.day);
                          days = DateTime(date.year, date.month + 1, 0).day;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: h15,
                      )),
                ),
//********************************* Calendar Button ************************/
                IconButton(
                    onPressed: () {
                      setState(() {
                        date = DateTime.now();
                      });
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
              pageController.jumpToPage(0);
              setState(() {
                date = DateTime.now();
                durationIndex = 0;
              });
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
              pageController.jumpToPage(1);
              setState(() {
                date = DateTime.now();
                durationIndex = 1;
              });
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
              pageController.jumpToPage(2);
              setState(() {
                date = DateTime.now();
                durationIndex = 2;
              });
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
