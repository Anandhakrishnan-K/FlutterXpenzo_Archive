import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

// ************************ Initialising Dimensions ***************************

double deviceHeight = 803;
double deviceWidtht = 392;

final double deviceWidth = deviceWidtht * 0.95;
final double tabHeight = deviceHeight * 0.07;
final double cardHeight = deviceHeight * 0.18;
final double cardHeight1 = deviceHeight * 0.12;
final double listHeight = deviceHeight * 0.56;
final double h05 = deviceHeight * 0.005;
final double h10 = deviceHeight * 0.01;
final double h15 = deviceHeight * 0.015;
final double h20 = deviceHeight * 0.02;
final double h25 = deviceHeight * 0.025;
final double h50 = deviceHeight * 0.05;
final double h75 = deviceHeight * 0.075;
final double h100 = deviceHeight * 0.1;

final double w05 = deviceWidth * 0.005;
final double w10 = deviceWidth * 0.01;
final double w15 = deviceWidth * 0.015;
final double w20 = deviceWidth * 0.02;
final double w25 = deviceWidth * 0.025;
final double w50 = deviceWidth * 0.05;
final double w75 = deviceWidth * 0.075;
final double w100 = deviceWidth * 0.1;

final double cardFontSize = deviceHeight * 0.017;
final double bottomSheetFontsize = deviceHeight * 0.017;

// ************************* Initialising Color Variables *********************

const Color transparent = Colors.transparent;
const Color appBarColor = Color(0xffB9D9EB);
const Color selectedFontColor = Color(0xff4169E1);
const Color expense = Color(0xffffe3e0);
const Color income = Color(0xffE5FDD1);
const Color cardFontColor = Colors.black;

// ************************* Initalizing Date formatting  *********************

DateTime date = DateTime.now();
DateFormat day = DateFormat('dd - MMM');
DateFormat month = DateFormat('MMM - yy');
DateFormat year = DateFormat('yyyy');
int days = DateTime(date.year, date.month + 1, 0).day;
int durationIndex = 0;

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
      style: GoogleFonts.poppins(
          fontSize: size,
          color: color,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      overflow: overflow,
      maxLines: 2,
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
        style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
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

//*********************************** Decoration ******************************

class MyCustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyCustomIndicatorPainter();
  }
}

class _MyCustomIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final paint = Paint()
      ..color = appBarColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(rect.center.dx, rect.bottom - 2), h05, paint);
  }
}
