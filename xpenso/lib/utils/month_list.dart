import 'package:flutter/material.dart';
import 'package:xpenso/BLoC/bloc_month.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/main.dart';

final monthTotalCreditListBloc = MonthTotalCreditListBloc();
final monthTotalDebitListBloc = MonthTotalDebitListBloc();
List<int> tmpCredit = [];
List<int> tmpDebit = [];

class MonthList extends StatefulWidget {
  const MonthList({super.key});

  @override
  State<MonthList> createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {
  @override
  void initState() {
    super.initState();
    monthTotalCreditListBloc.eventSink.add(MonthUpdate.credit);
    monthTotalDebitListBloc.eventSink.add(MonthUpdate.debit);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: DateTime.now(),
      stream: monthBloc.stateStream,
      builder: (context, snapshot) {
        DateTime temp = snapshot.data!;
        List<DateTime> tmpList = [];
        int daysInMonth = DateTime(temp.year, temp.month + 1, 0).day;
        for (int i = 1; i <= daysInMonth; i++) {
          tmpList.add(DateTime(temp.year, temp.month, i));
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          physics: const BouncingScrollPhysics(),
          itemCount: daysInMonth,
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
                              '${day.format(tmpList[index]).toString()} (${weekDay.format(tmpList[index])})',
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
                          StreamBuilder(
                            initialData: tmpCredit,
                            stream: monthTotalCreditListBloc.stateStream,
                            builder: (context, snapshot) {
                              List<int> credit = snapshot.data!;
                              if (credit.isNotEmpty) {
                                tmpCredit = credit;
                                debugPrint(
                                    'From Month Income Widget | Total length ${credit.length.toString()}');
                                return MyText(
                                  content: credit[index].toString(),
                                  size: cardFontSize * 1.1,
                                  isHeader: true,
                                );
                              }
                              return MyText(
                                content: 'Loading',
                                size: cardFontSize,
                              );
                            },
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
                          StreamBuilder(
                            initialData: tmpDebit,
                            stream: monthTotalDebitListBloc.stateStream,
                            builder: (context, snapshot) {
                              List<int> debit = snapshot.data!;
                              if (debit.isNotEmpty) {
                                tmpDebit = debit;
                                debugPrint(
                                    'From Month Income Widget | Total length ${debit.length.toString()}');
                                return MyText(
                                  content: debit[index].toString(),
                                  size: cardFontSize * 1.1,
                                  isHeader: true,
                                );
                              }
                              return MyText(
                                content: 'Loading',
                                size: cardFontSize,
                              );
                            },
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
