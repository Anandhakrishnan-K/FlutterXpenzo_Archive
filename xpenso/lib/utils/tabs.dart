import 'package:flutter/material.dart';
import '../constans.dart';

class MyHomeDay extends StatelessWidget {
  const MyHomeDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: cardHeight,
            width: deviceWidth,
            decoration: BoxDecoration(border: Border.all()),
          ),
          SizedBox(
            height: h10,
          ),
          Container(
            height: listHeight,
            width: deviceWidth,
            decoration: BoxDecoration(border: Border.all()),
          ),
        ],
      ),
    );
  }
}
