// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:xpenso/utils/add_expenses.dart';
import 'package:xpenso/utils/tabs.dart';
import 'constans.dart';

// Main Program Starts here
PageController pageController = PageController();

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: cardHeight + listHeight,
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
                                  return AddCredit();
                                },
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
//******************************** Main Page - Month **************************/
                      ExpenseCardMonth(),
                    ],
                  ),
                  Column(
//******************************** Main Page - Year ***************************/
                    children: const [
                      ExpenseCardYear(),
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
