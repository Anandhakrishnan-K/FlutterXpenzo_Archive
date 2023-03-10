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
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(h15),
            gradient:
                const LinearGradient(transform: GradientRotation(4.5), colors: [
              transparent,
              appBarColor,
              appBarColor,
            ])),
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
                      size: cardFontSize,
                    ),
                    MyText(
                      content: '1206', // Total Income
                      color: cardFontColor,
                      size: cardFontSize + h10,
                      isHeader: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: h15,
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
                      size: cardFontSize,
                    ),
                    MyText(
                      content: '126', // Total Expense
                      color: cardFontColor,
                      size: cardFontSize + h10,
                      isHeader: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: h15,
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tabHeight,
      width: deviceWidth,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(h15),
                gradient: const LinearGradient(
                    transform: GradientRotation(4.5),
                    colors: [
                      transparent,
                      appBarColor,
                      appBarColor,
                    ])),
            width: h75 * 3,
            child: Row(
              children: [
                SizedBox(
                  width: h05,
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
                        });
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
                      size: h20,
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
                        });
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: h15,
                      )),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        date = DateTime.now();
                      });
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
            textSize: durationIndex == 0 ? h25 + h05 : h25,
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
            textSize: durationIndex == 1 ? h25 + h05 : h25,
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
            textSize: durationIndex == 2 ? h25 + h05 : h25,
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
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(h15),
            gradient:
                const LinearGradient(transform: GradientRotation(4.5), colors: [
              transparent,
              appBarColor,
              appBarColor,
            ])),
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
                      size: cardFontSize,
                    ),
                    MyText(
                      content: '12060', // Total Income
                      color: cardFontColor,
                      size: cardFontSize,
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
                      size: cardFontSize,
                    ),
                    MyText(
                      content: '1260', // Total Expense
                      color: cardFontColor,
                      size: cardFontSize,
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
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(h15),
            gradient:
                const LinearGradient(transform: GradientRotation(4.5), colors: [
              transparent,
              appBarColor,
              appBarColor,
            ])),
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
                      size: cardFontSize,
                    ),
                    MyText(
                      content: '1206000', // Total Income
                      color: cardFontColor,
                      size: cardFontSize,
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
                      size: cardFontSize,
                    ),
                    MyText(
                      content: '12060', // Total Expense
                      color: cardFontColor,
                      size: cardFontSize,
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