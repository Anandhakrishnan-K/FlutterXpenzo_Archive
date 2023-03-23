import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/main.dart';

class YearList extends StatefulWidget {
  const YearList({super.key});

  @override
  State<YearList> createState() => _YearListState();
}

class _YearListState extends State<YearList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: DateTime.now(),
      stream: yearBloc.stateStream,
      builder: (context, snapshot) {
        DateTime date = snapshot.data!;
        List<DateTime> yearList = [
          DateTime(date.year, 1, 1),
          DateTime(date.year, 2, 1),
          DateTime(date.year, 3, 1),
          DateTime(date.year, 4, 1),
          DateTime(date.year, 5, 1),
          DateTime(date.year, 6, 1),
          DateTime(date.year, 7, 1),
          DateTime(date.year, 8, 1),
          DateTime(date.year, 9, 1),
          DateTime(date.year, 10, 1),
          DateTime(date.year, 11, 1),
          DateTime(date.year, 12, 1)
        ];
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          physics: const BouncingScrollPhysics(),
          itemCount: yearList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(h10),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h10,
                      ),
                      SizedBox(
                        height: h25,
                        child: MyText(
                          content: month.format(yearList[index]).toString(),
                          size: cardFontSize / 1.1,
                        ),
                      ),
                      SizedBox(
                        height: h25,
                        child: MyText(
                          content: 'Income:',
                          size: cardFontSize * 1.1,
                        ),
                      ),
                      SizedBox(
                        height: h10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.currency_rupee_rounded,
                            color: Colors.black,
                            size: cardFontSize * 1.2,
                          ),
                          SizedBox(
                            width: w25,
                          ),
                          MyText(
                            content: '1000',
                            size: cardFontSize * 1.1,
                            isHeader: true,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h20,
                      ),
                      SizedBox(
                        height: h25,
                        child: MyText(
                          content: 'Expense:',
                          size: cardFontSize * 1.1,
                        ),
                      ),
                      SizedBox(
                        height: h10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.currency_rupee_rounded,
                            color: Colors.black,
                            size: cardFontSize * 1.2,
                          ),
                          SizedBox(
                            width: w25,
                          ),
                          MyText(
                            content: '1000',
                            size: cardFontSize * 1.1,
                            isHeader: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
