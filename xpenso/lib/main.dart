import 'package:flutter/material.dart';
import 'package:xpenso/Screens/add_expense_page.dart';
import 'package:xpenso/constans.dart';
import 'Screens/app_bar.dart';
import 'Screens/expense_card.dart';

// ***********************  Program Starts Here  ***************************
void main(List<String> args) {
  runApp(const MainHome());
}

// *********************** Main Home Page Starts Here *********************
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(

// ************************* App Bar Starts Here ***************************

            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(70), child: MyappBar()),

// ************************** Main Content Starts Here *************************

            body: TabBarView(physics: const BouncingScrollPhysics(), children: [
// ************************* Charts Page Starts Here ***************************

              Container(
                child: Center(
                  child: MyButton(content: 'Charts', onPressed: () {}),
                ),
              ),

// ************************* Home Page Start Here ******************************

              Container(
                color: temp,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                      height: 500,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
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
                              title: Text(
                                  'Amount ${index + 1} to be displayed here'),
                              subtitle: Text(
                                  'Entered Notes ${index + 1} to be displayed here'),
                              trailing: const ImageIcon(
                                AssetImage('assets/icons/delete.png'),
                                size: 30,
                                color: Colors.red,
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),

// ************************* Reports page Goes Here ****************************

              Container(
                child: Center(
                  child: MyButton(content: 'Reports', onPressed: () {}),
                ),
              ),
            ])),
      ),
    );
  }
}
