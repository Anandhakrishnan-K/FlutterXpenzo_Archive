import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/utils/tabs.dart';

class MonthList extends StatefulWidget {
  const MonthList({super.key});

  @override
  State<MonthList> createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: days,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: h10),
          child: Container(
            height: h100 + h25,
            width: deviceWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(h15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: h05 / 4,
                    offset: Offset(0, h05 / 4),
                  )
                ]),
            child: ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w100,
                      ),
                      Icon(
                        Icons.currency_rupee_rounded,
                        color: Colors.black,
                        size: cardFontSize * 1.5,
                      ),
                      SizedBox(
                        width: w25,
                      ),
                      MyText(
                        content: '100000',
                        size: cardFontSize * 1.2,
                        isHeader: true,
                      )
                    ],
                  ),
                  SizedBox(
                    height: h20,
                  ),
                  SizedBox(
                    height: h50,
                    child: MyText(
                      content: 'Row No:$index  | Month: ${month.format(date)}',
                      size: cardFontSize / 1.1,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
