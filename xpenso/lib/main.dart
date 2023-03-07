// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
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
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      animationDuration: Duration(milliseconds: 500),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: tabHeight,
            elevation: 0,
            backgroundColor: transparent,
            centerTitle: true,
            title: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: h20, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: h20),
                unselectedLabelColor: Colors.black,
                labelColor: appBarColor,
                indicator: MyCustomIndicator(),
                tabs: const [
                  Tab(
                    text: 'Charts',
                  ),
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Reports',
                  )
                ]),
          ),
          body: TabBarView(
              physics: BouncingScrollPhysics(),
              children: const [MyHomeDay(), MyHomeDay(), MyHomeDay()])),
    );
  }
}
