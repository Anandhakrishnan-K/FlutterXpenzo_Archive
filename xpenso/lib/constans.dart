import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ************************* Initialising Color Variables *********************
const Color appBarColor = Color(0xff76ABDF);
const Color cardColor = Color.fromARGB(255, 240, 240, 240);
const Color cardFontColor = Colors.black;
Color temp = Colors.white;

// ************************* Initialising Numering Variables ******************

double demoAmount = 132000;
double demoAmount1 = 98000;
DateFormat dateFormat = DateFormat('dd (E)');
DateFormat monthFormat = DateFormat('MMM');
DateFormat yearFormat = DateFormat('yyyy');
DateFormat cardFormat = DateFormat('dd - MMM - yyyy');
DateTime dateSelected = DateTime.now();

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

class MyButton extends StatefulWidget {
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
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.fillColor,
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.rad)),
      child: TextButton(
        onPressed: widget.onPressed,
        child: MyText(
          content: widget.content,
          color: widget.textcolor,
          size: widget.textSize,
          isHeader: widget.isBold,
        ),
      ),
    );
  }
}
