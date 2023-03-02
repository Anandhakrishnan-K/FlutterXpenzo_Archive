import 'package:flutter/material.dart';

// ************************* Initialising Color Variables *********************
const Color appBarColor = Color(0xff76ABDF);
const Color cardColor = Color(0xffB9D9EB);
const Color cardFontColor = Colors.black;
Color temp = Colors.white;

// ************************* Initialising Numering Variables ******************

double demoAmount = 132000;
double demoAmount1 = 98000;

// ************************* Custom Text Widget ******************************//

class MyText extends StatelessWidget {
  final String content;
  final double size;
  final Color color;
  final bool isHeader;
  final TextOverflow overflow;
  const MyText(
      {super.key,
      required this.content,
      this.size = 16,
      this.color = Colors.black,
      this.overflow = TextOverflow.ellipsis,
      this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      overflow: overflow,
    );
  }
}

// ************************* Custom Button Widget ****************************//

class MyButton extends StatelessWidget {
  final String content;
  final Function()? onPressed;
  final double textSize;
  final bool isBold;
  final double height;
  final double width;
  final Color textcolor;
  final Color borderColor;
  final Color fillColor;
  final double rad;

  const MyButton(
      {super.key,
      required this.content,
      this.textSize = 15,
      this.isBold = false,
      this.height = 50,
      this.width = 100,
      this.textcolor = Colors.black,
      this.borderColor = Colors.black,
      this.fillColor = Colors.white,
      this.rad = 5,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(rad)),
      child: TextButton(
        onPressed: onPressed,
        child: MyText(
          content: content,
          color: textcolor,
          size: textSize,
          isHeader: isBold,
        ),
      ),
    );
  }
}
