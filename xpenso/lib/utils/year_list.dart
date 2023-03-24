import 'package:flutter/material.dart';
import 'package:xpenso/BLoC/year_bloc.dart';
import 'package:xpenso/constans.dart';

final yearUpadteBloc = YearUpadteBloc();
final yearTotalBloc = YearTotalBloc();
List<MapEntry<DateTime, MapEntry<int, int>>> emptyList = [];

class YearList extends StatefulWidget {
  const YearList({super.key});

  @override
  State<YearList> createState() => _YearListState();
}

class _YearListState extends State<YearList> {
  @override
  void initState() {
    super.initState();
    yearUpadteBloc.eventSink.add(YearUpdate.update);
    debugPrint('From Year List init state Method: State Initiated');
  }

  @override
  void dispose() {
    debugPrint('From year List Dipose Method: State killed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: emptyList,
      stream: yearUpadteBloc.stateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MapEntry<DateTime, MapEntry<int, int>>> yearList =
              snapshot.data!;
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
                            content:
                                month.format(yearList[index].key).toString(),
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
                              content: yearList[index].value.key.toString(),
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
                              content: yearList[index].value.value.toString(),
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
        }
        return const MyText(content: 'Loading');
      },
    );
  }
}
