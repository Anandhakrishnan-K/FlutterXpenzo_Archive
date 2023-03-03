library date_time_line;

import 'package:flutter/material.dart';
import 'package:xpenso/Screens/tabs.dart';
import 'package:xpenso/constans.dart';
import 'Screens/app_bar.dart';
import 'time_slider.dart';

// ***********************  Program Starts Here  ***************************
void main(List<String> args) {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: MainHome()));
}

// *********************** Main Home Page Starts Here *********************
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(

// ************************* App Bar Starts Here ***************************

            // ignore: prefer_const_constructors
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                // ignore: prefer_const_constructors
                child: MyappBar()),

// ************************** Main Content Starts Here *************************

            body: TabBarView(physics: const BouncingScrollPhysics(), children: [
// ************************* Charts Page Starts Here ***************************

              const Center(child: MyText(content: 'This is Charts Section')),

// ************************* Home Page Start Here ******************************

              Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        MyButton(
                            content:
                                (dateFormat.format(dateSelected)).toString(),
                            height: currentTab == 0 ? 45 : 40,
                            width: 100,
                            isBold: currentTab == 0 ? true : false,
                            borderColor:
                                currentTab == 0 ? appBarColor : Colors.black,
                            fillColor:
                                currentTab == 0 ? cardColor : Colors.white,
                            onPressed: () {
                              setState(() {
                                currentTab = 0;
                              });
                              pageController.animateToPage(0,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            }),
                        const SizedBox(
                          width: 25,
                        ),
                        MyButton(
                            content:
                                (monthFormat.format(dateSelected)).toString(),
                            height: currentTab == 1 ? 45 : 40,
                            width: 100,
                            isBold: currentTab == 1 ? true : false,
                            borderColor:
                                currentTab == 1 ? appBarColor : Colors.black,
                            fillColor:
                                currentTab == 1 ? cardColor : Colors.white,
                            onPressed: () {
                              setState(() {
                                currentTab = 1;
                              });
                              pageController.animateToPage(1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            }),
                        const SizedBox(
                          width: 25,
                        ),
                        MyButton(
                            content:
                                (yearFormat.format(dateSelected)).toString(),
                            height: currentTab == 2 ? 45 : 40,
                            width: 100,
                            isBold: currentTab == 2 ? true : false,
                            borderColor:
                                currentTab == 2 ? appBarColor : Colors.black,
                            fillColor:
                                currentTab == 2 ? cardColor : Colors.white,
                            onPressed: () {
                              setState(() {
                                currentTab = 2;
                              });
                              pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: MyButton(
                      fillColor: Colors.transparent,
                      content:
                          '<   ${cardFormat.format(dateSelected).toString()}   >',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Center(child: Text('Pick a Date')),
                                content: DateTimeLine(
                                    width: 100,
                                    color: appBarColor,
                                    onSelected: (value) {
                                      setState(() {
                                        dateSelected = value;
                                      });
                                      // ignore: avoid_print
                                      print(dateSelected);
                                      Navigator.of(context).pop();
                                    }),
                              );
                            });
                      },
                      borderColor: Colors.transparent,
                      textSize: 15,
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 600,
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        MyDayTab(),
                        // ignore: prefer_const_constructors
                        MyMonthTab(),
                        // ignore: prefer_const_constructors
                        MyYearTab(),
                      ],
                    ),
                  ),
                ],
              ),

// ************************* Reports page Goes Here ****************************

              Center(
                child: MyButton(content: 'Reports', onPressed: () {}),
              ),
            ])),
      ),
    );
  }
}
