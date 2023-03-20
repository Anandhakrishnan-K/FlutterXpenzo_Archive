import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/utils/tabs.dart';

List monthList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

class MonthList extends StatefulWidget {
  const MonthList({super.key});

  @override
  State<MonthList> createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: DateTime.now(),
      stream: monthBloc.stateListStream,
      builder: (context, snapshot) {
        DateTime temp = snapshot.data!;
        int daysInMonth = DateTime(temp.year, temp.month + 1, 0).day;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: daysInMonth,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h20,
                      ),
                      MyText(
                        content: '100000',
                        size: cardFontSize,
                        isHeader: true,
                      ),
                      SizedBox(
                        height: h20,
                      ),
                      SizedBox(
                        height: h50,
                        child: MyText(
                          content: 'Row No:$index | Total: $daysInMonth',
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
      },
    );
  }
}
