import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../constans.dart';

class MyappBar extends StatelessWidget {
  const MyappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: SizedBox(
        height: 50,
        width: 400,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
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
                indicator: DotIndicator(
                    color: appBarColor, radius: 3, distanceFromCenter: 20),
                labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            // ****************  AppBar Right Icon ***************** //
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      const AssetImage('assets/icons/change.png'),
                      size: 40,
                      color: appBarColor,
                    )))
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
