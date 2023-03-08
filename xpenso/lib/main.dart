// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:xpenso/utils/add_expenses.dart';
import 'package:xpenso/utils/tabs.dart';
import 'constans.dart';

// Main Program Starts here

void main(List<String> args) {
  runApp(MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
        foregroundColor: appBarColor,
        centerTitle: true,
        title: MyText(
          content: 'XpenZo',
          size: h25,
          isHeader: true,
          color: appBarColor,
        ),
        actions: [
          Icon(
            Icons.access_alarm,
            size: 30,
          ),
          SizedBox(
            width: h25,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: h15,
            ),
            ExpenseCard(
              onPressedCredit: () {
                setState(() {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AddCredit();
                    },
                  );
                });
              },
              onPressedDebit: () {
                setState(() {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: h100,
                        color: appBarColor,
                      );
                    },
                  );
                });
              },
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
