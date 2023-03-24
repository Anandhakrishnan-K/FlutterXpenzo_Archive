import 'package:flutter/material.dart';
import 'package:xpenso/BLoC/bloc_month.dart';
import 'package:xpenso/constans.dart';

final monthTotalListBloc = MonthTotalListBloc();
final monthTotalBloc = MonthTotalBloc();
List<MapEntry<DateTime, MapEntry<int, int>>> tmpCredit = [
  MapEntry(DateTime.now(), const MapEntry(0, 0))
];
List<MapEntry<DateTime, MapEntry<int, int>>> tmpCreditEmpty = [];

class MonthList extends StatefulWidget {
  const MonthList({super.key});

  @override
  State<MonthList> createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {
  @override
  void initState() {
    super.initState();
    monthTotalListBloc.eventSink.add(MonthUpdate.update);
    debugPrint('From Month Initiate Method: Month List Initaited');
  }

  @override
  void dispose() {
    debugPrint('From Month Dispose Method: Month List Killed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: tmpCreditEmpty,
      stream: monthTotalListBloc.stateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MapEntry<DateTime, MapEntry<int, int>>> temp = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            physics: const BouncingScrollPhysics(),
            itemCount: temp.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(h10),
                child: Container(
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
                      children: [
                        SizedBox(
                          height: h10,
                        ),
                        SizedBox(
                          height: h25,
                          child: MyText(
                            content:
                                '${day.format(temp[index].key).toString()} (${weekDay.format(temp[index].key)})',
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
                              content: temp[index].value.key.toString(),
                              size: cardFontSize * 1.1,
                              isHeader: true,
                            ),
                            // StreamBuilder(
                            //   initialData: tmpCredit,
                            //   stream: monthTotalListBloc.stateStream,
                            //   builder: (context, snapshot) {
                            //     List<MapEntry<DateTime, MapEntry<int, int>>>
                            //         credit = snapshot.data!;
                            //     if (credit.isNotEmpty) {
                            //       tmpCredit = credit;
                            //       debugPrint(
                            //           'From Month Income Widget | Total length ${credit.length.toString()}');
                            //       return MyText(
                            //         content: credit[index].value.key.toString(),
                            //         size: cardFontSize * 1.1,
                            //         isHeader: true,
                            //       );
                            //     }
                            //     return MyText(
                            //       content: 'Loading',
                            //       size: cardFontSize,
                            //     );
                            //   },
                            // ),
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
                              content: temp[index].value.value.toString(),
                              size: cardFontSize * 1.1,
                              isHeader: true,
                            ),
                            // StreamBuilder(
                            //   initialData: tmpDebit,
                            //   stream: monthTotalDebitListBloc.stateStream,
                            //   builder: (context, snapshot) {
                            //     List<int> debit = snapshot.data!;
                            //     if (debit.isNotEmpty) {
                            //       tmpDebit = debit;
                            //       debugPrint(
                            //           'From Month Income Widget | Total length ${debit.length.toString()}');
                            //       return MyText(
                            //         content: debit[index].toString(),
                            //         size: cardFontSize * 1.1,
                            //         isHeader: true,
                            //       );
                            //     }
                            //     return MyText(
                            //       content: 'Loading',
                            //       size: cardFontSize,
                            //     );
                            //   },
                            // ),
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
