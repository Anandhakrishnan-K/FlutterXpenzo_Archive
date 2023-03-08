import 'package:flutter/material.dart';
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
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(4),
                colors: [
                  Colors.transparent,
                  appBarColor,
                ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: h25 + h15,
                ),
                MyText(
                  content: 'Total Income',
                  color: Colors.white,
                  size: h25,
                ),
                SizedBox(
                  height: h20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: Colors.white,
                      size: h25,
                    ),
                    MyText(
                      content: '1206000',
                      color: Colors.white,
                      size: h25,
                      isHeader: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: h25,
                ),
                MyButton(
                    content: 'Add Credit',
                    fillColor: transparent,
                    borderColor: Colors.white,
                    textcolor: Colors.white,
                    isBold: true,
                    textSize: h20,
                    onPressed: widget.onPressedCredit)
              ],
            ),
            VerticalDivider(
              color: Colors.white,
              thickness: 1,
              indent: h25,
              endIndent: h25,
            ),
            Column(
              children: [
                SizedBox(
                  height: h25 + h15,
                ),
                MyText(
                  content: 'Total Expense',
                  color: Colors.white,
                  size: h25,
                ),
                SizedBox(
                  height: h20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: Colors.white,
                      size: h25,
                    ),
                    MyText(
                      content: '12060',
                      color: Colors.white,
                      size: h25,
                      isHeader: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: h25,
                ),
                MyButton(
                    content: 'Add Debit',
                    fillColor: transparent,
                    borderColor: Colors.white,
                    textcolor: Colors.white,
                    isBold: true,
                    textSize: h20,
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
