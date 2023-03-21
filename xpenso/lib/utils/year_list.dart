import 'package:flutter/material.dart';
import 'package:xpenso/BLoC/bloc_page.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/utils/tabs.dart';

final setIndex = SetPageBloc();

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
        date = snapshot.data!;
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
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: yearList.length,
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
                          content:
                              '${month.format(yearList[index]).toString()} Data to be Displayed',
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
