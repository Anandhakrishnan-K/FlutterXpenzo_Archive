import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';
import 'expense_card.dart';

double cardHeightDay = 170;
double listHeightDay = 430;
double cardHeight = 110;
double listHeight = 490;

class MyDayTab extends StatefulWidget {
  const MyDayTab({super.key});

  @override
  State<MyDayTab> createState() => _MyDayTabState();
}

class _MyDayTabState extends State<MyDayTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(
          height: cardHeightDay,
          child: ExpenseCard(
            onPressedCredit: () {
              // ignore: avoid_print
              print('Cliking Credit');
              setState(() {});
            },
            onPressedDebit: () {
              // ignore: avoid_print
              print('Cliking Debit');
              setState(() {});
            },
          ),
        ),
        Container(
          width: 400,
          height: listHeightDay,
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 30,
              itemBuilder: (buildContext, index) {
                return ListTile(
                  leading: const ImageIcon(
                    AssetImage('assets/icons/salary.png'),
                    size: 40,
                    color: cardFontColor,
                  ),
                  title: Text('Amount ${index + 1} to be displayed here'),
                  subtitle:
                      Text('Entered Notes ${index + 1} to be displayed here'),
                );
              }),
        )
      ],
    );
  }
}

class MyMonthTab extends StatefulWidget {
  const MyMonthTab({super.key});

  @override
  State<MyMonthTab> createState() => _MyMonthTabState();
}

class _MyMonthTabState extends State<MyMonthTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          height: cardHeight,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ExpenseCardYM(
            onPressedCredit: () {
              // ignore: avoid_print
              print('Cliking Credit');
              setState(() {});
            },
            onPressedDebit: () {
              // ignore: avoid_print
              print('Cliking Debit');
              setState(() {});
            },
          ),
        ),
        Container(
          width: 400,
          height: listHeight,
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 30,
              itemBuilder: (buildContext, index) {
                return ListTile(
                  leading: const ImageIcon(
                    AssetImage('assets/icons/salary.png'),
                    size: 40,
                    color: cardFontColor,
                  ),
                  title: Text('Day ${index + 1} Amount to be displayed here'),
                  subtitle:
                      Text('Entered Notes ${index + 1} to be displayed here'),
                  trailing: const ImageIcon(
                    AssetImage('assets/icons/delete.png'),
                    size: 30,
                    color: Colors.red,
                  ),
                );
              }),
        )
      ],
    );
  }
}

class MyYearTab extends StatefulWidget {
  const MyYearTab({super.key});

  @override
  State<MyYearTab> createState() => _MyYearTabState();
}

class _MyYearTabState extends State<MyYearTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          height: cardHeight,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ExpenseCardYM(
            onPressedCredit: () {
              // ignore: avoid_print
              print('Cliking Credit');
              setState(() {});
            },
            onPressedDebit: () {
              // ignore: avoid_print
              print('Cliking Debit');
              setState(() {});
            },
          ),
        ),
        Container(
          width: 400,
          height: listHeight,
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 12,
              itemBuilder: (buildContext, index) {
                return ListTile(
                  leading: const ImageIcon(
                    AssetImage('assets/icons/salary.png'),
                    size: 40,
                    color: cardFontColor,
                  ),
                  title: Text('Month ${index + 1} Amount to be displayed here'),
                  subtitle:
                      Text('Entered Notes ${index + 1} to be displayed here'),
                  trailing: const ImageIcon(
                    AssetImage('assets/icons/delete.png'),
                    size: 30,
                    color: Colors.red,
                  ),
                );
              }),
        )
      ],
    );
  }
}
