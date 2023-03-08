import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';

class AddCredit extends StatefulWidget {
  const AddCredit({super.key});

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight * 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(4),
              colors: [
            Colors.transparent,
            appBarColor,
          ])),
    );
  }
}
