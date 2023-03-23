import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xpenso/DataBase/data_model.dart';
import 'package:xpenso/DataBase/db_connnection.dart';
import 'package:xpenso/constans.dart';

enum DayUpdate { update }

final List<Ledger> tmpData = [];
final service = Services();

class DayUpdateBloc {
  final dayStateStreamController = StreamController<List<Ledger>>.broadcast();
  StreamSink<List<Ledger>> get stateSink => dayStateStreamController.sink;
  Stream<List<Ledger>> get stateStream => dayStateStreamController.stream;

  final dayEventStreamController = StreamController<DayUpdate>();
  StreamSink<DayUpdate> get eventSink => dayEventStreamController.sink;
  Stream<DayUpdate> get eventStream => dayEventStreamController.stream;

  DayUpdateBloc() {
    eventStream.listen((event) async {
      if (event == DayUpdate.update) {
        DateTime tmp = dateSelected;
        debugPrint('Day Upadte Function called and current date : $tmp');
        String dayDay = d.format(tmp).toString();
        String monthDay = m.format(tmp).toString();
        String yearDay = y.format(tmp).toString();

        tmpData.clear();
        var data = await service.getData(dayDay, monthDay, yearDay);
        data.forEach((ledger) {
          var dataModel = Ledger();
          dataModel.id = ledger['id'];
          dataModel.amount = ledger['amount'];
          dataModel.notes = ledger['notes'];
          dataModel.categoryIndex = ledger['categoryIndex'];
          dataModel.categoryFlag = ledger['categoryFlag'] == 1 ? true : false;
          dataModel.day = ledger['day'];
          dataModel.month = ledger['month'];
          dataModel.year = ledger['year'];
          dataModel.createdT = ledger['createdT'];
          dataModel.attachmentFlag =
              ledger['attachmentFlag'] == 1 ? true : false;
          dataModel.attachmentName = ledger['attachmentName'];

          tmpData.add(dataModel);
        });
      }
      debugPrint('${tmpData.length}');
      stateSink.add(tmpData);
    });
  }
}
