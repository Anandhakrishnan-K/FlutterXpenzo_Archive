import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/main.dart';

enum MonthUpdate { credit, debit }

class MonthTotalCreditListBloc {
  final monthStateStreamController = StreamController<List<int>>.broadcast();
  StreamSink<List<int>> get stateSink => monthStateStreamController.sink;
  Stream<List<int>> get stateStream => monthStateStreamController.stream;

  final monthEventStreamController = StreamController<MonthUpdate>();
  StreamSink<MonthUpdate> get eventSink => monthEventStreamController.sink;
  Stream<MonthUpdate> get eventStream => monthEventStreamController.stream;

  MonthTotalCreditListBloc() {
    eventStream.listen((event) async {
      DateTime date = dateSelected;
      List<DateTime> tmpList = [];
      int n = DateTime(date.year, date.month + 1, 0).day;
      for (int i = 1; i <= n; i++) {
        tmpList.add(DateTime(date.year, date.month, i));
      }
      List<int> creditMonthList = [];
      int tmp = 0;
      if (event == MonthUpdate.credit) {
        for (int i = 0; i < tmpList.length; i++) {
          String mDay = d.format(tmpList[i]).toString();
          String mMonth = m.format(tmpList[i]).toString();
          String mYear = y.format(tmpList[i]).toString();
          List<Map<String, dynamic>> data =
              await service.getDayTotal(mDay, mMonth, mYear, '1');

          //Null Check
          if (data.isNotEmpty && data[0]['sum'] != null) {
            tmp = int.parse(data[0]['sum'].toString());
          } else {
            tmp = 0;
          }
          creditMonthList.add(tmp);
        }
        debugPrint(
            'Update Month credit List BLoc | Total Length: ${creditMonthList.length.toString()} | Date @ 0 ${tmpList[0].toString()} | amount @ 0 ${creditMonthList[0].toString()}');
        stateSink.add(creditMonthList);
      }
    });
  }
}

//**************************** For Getting Monthly Expense Day wise *********************/

class MonthTotalDebitListBloc {
  final monthStateStreamController = StreamController<List<int>>.broadcast();
  StreamSink<List<int>> get stateSink => monthStateStreamController.sink;
  Stream<List<int>> get stateStream => monthStateStreamController.stream;

  final monthEventStreamController = StreamController<MonthUpdate>();
  StreamSink<MonthUpdate> get eventSink => monthEventStreamController.sink;
  Stream<MonthUpdate> get eventStream => monthEventStreamController.stream;

  MonthTotalDebitListBloc() {
    eventStream.listen((event) async {
      DateTime date = dateSelected;
      List<DateTime> tmpList = [];
      int n = DateTime(date.year, date.month + 1, 0).day;
      for (int i = 1; i <= n; i++) {
        tmpList.add(DateTime(date.year, date.month, i));
      }
      List<int> debitMonthList = [];
      int tmp = 0;
      if (event == MonthUpdate.debit) {
        for (int i = 0; i < tmpList.length; i++) {
          String mDay = d.format(tmpList[i]).toString();
          String mMonth = m.format(tmpList[i]).toString();
          String mYear = y.format(tmpList[i]).toString();
          List<Map<String, dynamic>> data =
              await service.getDayTotal(mDay, mMonth, mYear, '0');

          //Null Check
          if (data.isNotEmpty && data[0]['sum'] != null) {
            tmp = int.parse(data[0]['sum'].toString());
          } else {
            tmp = 0;
          }
          debitMonthList.add(tmp);
        }
        debugPrint(
            'Update Month credit List BLoc | Total Length: ${debitMonthList.length.toString()} | Date @ 0 ${tmpList[0].toString()} | amount @ 0 ${debitMonthList[0].toString()}');
        stateSink.add(debitMonthList);
      }
    });
  }
}
