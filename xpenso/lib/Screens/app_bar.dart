import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../constans.dart';

class MyappBar extends StatefulWidget {
  const MyappBar({super.key});

  @override
  State<MyappBar> createState() => _MyappBarState();
}

class _MyappBarState extends State<MyappBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 70,
      title: TabBar(
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        //Initializing the Tab Bar
        tabs: const [
          Tab(
            text: 'Charts',
          ),
          Tab(
            text: 'Home',
          ),
          Tab(
            text: 'Reports',
          ),
        ],
        labelColor: appBarColor,
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        indicator:
            DotIndicator(color: appBarColor, radius: 3, distanceFromCenter: 20),
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
