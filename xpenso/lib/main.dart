// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:xpenso/utils/add_expenses.dart';
import 'package:xpenso/utils/list_builder.dart';
import 'package:xpenso/utils/month_list.dart';
import 'package:xpenso/utils/tabs.dart';
import 'constans.dart';

// Main Program Starts here
PageController pageController = PageController();
final MaterialColor colorPrimary = MaterialColor(
  0xFF91C8FF,
  const <int, Color>{
    50: Color(0xFFE9F2F9),
    100: Color(0xFFC8DDEE),
    200: Color(0xFFA2C2E2),
    300: Color(0xFF7BA7D6),
    400: Color(0xFF5B92CC),
    500: Color(0xFF3B7DBF),
    600: Color(0xFF3475B8),
    700: Color(0xFF2B6BAC),
    800: Color(0xFF2361A1),
    900: Color(0xFF174F8E),
  },
);

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(
        primarySwatch: colorPrimary,
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
      resizeToAvoidBottomInset: false,
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
              height: cardHeight + listHeight + h10,
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
//******************************* Adding Credit Buttton ************************/
                          onPressedCredit: () {
                            setState(() {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(h20),
                                        topRight: Radius.circular(h20))),
                                isDismissible: false,
                                isScrollControlled: true,
                                elevation: h25,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: AddCredit(
                                        submitButtonName: 'Add credit / Income',
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ));
                                },
                              );
                            });
                          },
//******************************* Adding Debit Buttton ************************/
                          onPressedDebit: () {
                            setState(() {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(h20),
                                        topRight: Radius.circular(h20))),
                                isDismissible: false,
                                isScrollControlled: true,
                                elevation: h25,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: AddCredit(
                                      submitButtonName: 'Add Debit / Expense',
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              );
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: h10,
                      ),
                      SizedBox(
                        height: listHeight,
                        child: ListBuilder(),
                      )
                    ],
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
//******************************** Main Page - Month **************************/
                      SizedBox(height: cardHeight1, child: ExpenseCardMonth()),
                      SizedBox(
                        height: h10,
                      ),
                      SizedBox(
                        height: listHeight + h50,
                        child: MonthList(),
                      )
                    ],
                  ),
                  Column(
//******************************** Main Page - Year ***************************/
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
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
