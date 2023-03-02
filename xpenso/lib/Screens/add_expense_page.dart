import 'package:flutter/material.dart';

class AddExpensePage extends StatelessWidget {
  final String path;
  final Color color;
  final double height;
  final double radius;

  const AddExpensePage(
      {super.key,
      required this.path,
      this.color = Colors.grey,
      this.height = 400,
      this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius))),
            backgroundColor: color,
            elevation: 10,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: height,
              );
            });
      },
      icon: ImageIcon(
        AssetImage(path),
        semanticLabel: 'Add',
        size: 40,
        color: Colors.black,
      ),
    );
  }
}
