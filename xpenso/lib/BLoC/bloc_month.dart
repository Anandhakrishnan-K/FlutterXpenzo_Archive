import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';

enum MonthEvent { add, minus }

class MonthBloc {
  final monthStateStreameController = StreamController<DateTime>();
  StreamSink<DateTime> get stateSink => monthStateStreameController.sink;
  Stream<DateTime> get stateStream => monthStateStreameController.stream;

  final monthListStateStreameController = StreamController<DateTime>();
  StreamSink<DateTime> get stateListSink =>
      monthListStateStreameController.sink;
  Stream<DateTime> get stateListStream =>
      monthListStateStreameController.stream;

  final monthEventStreamController = StreamController<MonthEvent>();
  StreamSink<MonthEvent> get eventSink => monthEventStreamController.sink;
  Stream<MonthEvent> get eventStream => monthEventStreamController.stream;

  MonthBloc() {
    eventStream.listen((event) {
      if (event == MonthEvent.add) {
        date = DateTime(date.year, date.month + 1, date.day);
        debugPrint(date.toString());
      } else if (event == MonthEvent.minus) {
        date = DateTime(date.year, date.month - 1, date.day);
        debugPrint(date.toString());
      }
      stateSink.add(date);
      stateListSink.add(date);
    });
  }
}
