import 'package:flutter/material.dart';
import 'package:xpenso/Screens/add_expense_page.dart';
import 'package:xpenso/constans.dart';

class ExpenseCard extends StatelessWidget {
  final Function()? onPressedCredit;
  final Function()? onPressedDebit;
  const ExpenseCard({
    super.key,
    required this.onPressedCredit,
    required this.onPressedDebit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ****************** Credit *********************//
          InkWell(
            onTap: onPressedCredit,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 180,
              child: Card(
                shadowColor: cardColor,
                color: cardColor,
                elevation: 5,
                child: ListTile(
                  title: SizedBox(
                    height: 160,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.only(top: 15),
                            child: const MyText(
                              content: 'Total Credit',
                              size: 16,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(top: 15),
                            child: MyText(
                              content: '₹ ${demoAmount.toString()}',
                              size: 20,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 5),
                            // ignore: prefer_const_constructors
                            child: AddExpensePage(
                                color: const Color(0xffE5FDD1),
                                path: 'assets/icons/income.png')),
                        const MyText(
                          content: 'Add Credit',
                          size: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ******************* Debit **********************//
          InkWell(
            onTap: onPressedDebit,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 180,
              child: Card(
                shadowColor: cardColor,
                color: cardColor,
                elevation: 5,
                child: ListTile(
                  title: SizedBox(
                    height: 160,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.only(top: 15),
                            child: const MyText(
                              content: 'Total Debit',
                              size: 16,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(top: 15),
                            child: MyText(
                              content: '₹ ${demoAmount1.toString()}',
                              size: 20,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 5),
                            // ignore: prefer_const_constructors
                            child: AddExpensePage(
                                color: const Color(0xffffe3e0),
                                path: 'assets/icons/expenses.png')),
                        const MyText(
                          content: 'Add Debit',
                          size: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseCardYM extends StatelessWidget {
  final Function()? onPressedCredit;
  final Function()? onPressedDebit;
  const ExpenseCardYM({
    super.key,
    required this.onPressedCredit,
    required this.onPressedDebit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ****************** Credit *********************//
          InkWell(
            onTap: onPressedCredit,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 180,
              child: Card(
                shadowColor: cardColor,
                color: cardColor,
                elevation: 5,
                child: ListTile(
                  title: SizedBox(
                    height: 160,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.only(top: 15),
                            child: const MyText(
                              content: 'Total Credit',
                              size: 16,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(top: 15),
                            child: MyText(
                              content: '₹ ${demoAmount.toString()}',
                              size: 20,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ******************* Debit **********************//
          InkWell(
            onTap: onPressedDebit,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 180,
              child: Card(
                shadowColor: cardColor,
                color: cardColor,
                elevation: 5,
                child: ListTile(
                  title: SizedBox(
                    height: 160,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.only(top: 15),
                            child: const MyText(
                              content: 'Total Debit',
                              size: 16,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(top: 15),
                            child: MyText(
                              content: '₹ ${demoAmount1.toString()}',
                              size: 20,
                              color: cardFontColor,
                              isHeader: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
