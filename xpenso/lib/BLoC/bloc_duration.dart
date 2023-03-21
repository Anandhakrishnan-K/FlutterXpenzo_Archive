import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';

enum MonthEvent { add, minus, jump, jump0 }

class MonthBloc {
  final monthStateStreameController = StreamController<DateTime>.broadcast();
  StreamSink<DateTime> get stateSink => monthStateStreameController.sink;
  Stream<DateTime> get stateStream => monthStateStreameController.stream;

  final monthEventStreamController = StreamController<MonthEvent>();
  StreamSink<MonthEvent> get eventSink => monthEventStreamController.sink;
  Stream<MonthEvent> get eventStream => monthEventStreamController.stream;

  MonthBloc() {
    eventStream.listen((event) {
      if (event == MonthEvent.add) {
        date = DateTime(date.year, date.month + 1, date.day);
        debugPrint('Add Month$date');
      } else if (event == MonthEvent.minus) {
        date = DateTime(date.year, date.month - 1, date.day);
        debugPrint('Minus Month$date');
      } else if (event == MonthEvent.jump) {
        debugPrint('Month Jump $date');
      } else if (event == MonthEvent.jump0) {
        date = DateTime.now();
        debugPrint('Month Jump 0$date');
      }
      stateSink.add(date);
    });
  }
}

enum DayEvent { add, minus, jump, jump0 }

class DayBloc {
  final dayStateStreameController = StreamController<DateTime>.broadcast();
  StreamSink<DateTime> get stateSink => dayStateStreameController.sink;
  Stream<DateTime> get stateStream => dayStateStreameController.stream;

  final dayEventStreamController = StreamController<DayEvent>();
  StreamSink<DayEvent> get eventSink => dayEventStreamController.sink;
  Stream<DayEvent> get eventStream => dayEventStreamController.stream;

  DayBloc() {
    eventStream.listen((event) {
      if (event == DayEvent.add) {
        date = DateTime(date.year, date.month, date.day + 1);
        debugPrint('Add Day$date');
      } else if (event == DayEvent.minus) {
        date = DateTime(date.year, date.month, date.day - 1);
        debugPrint('Minus day$date');
      } else if (event == DayEvent.jump) {
        debugPrint('Jump Day$date');
      } else if (event == DayEvent.jump0) {
        date = DateTime.now();
        debugPrint('Jump Day 0$date');
      }
      stateSink.add(date);
    });
  }
}

enum YearEvent { add, minus, jump, jump0 }

class YearBloc {
  final yearStateStreameController = StreamController<DateTime>.broadcast();
  StreamSink<DateTime> get stateSink => yearStateStreameController.sink;
  Stream<DateTime> get stateStream => yearStateStreameController.stream;

  final yearEventStreamController = StreamController<YearEvent>();
  StreamSink<YearEvent> get eventSink => yearEventStreamController.sink;
  Stream<YearEvent> get eventStream => yearEventStreamController.stream;

  YearBloc() {
    eventStream.listen((event) {
      if (event == YearEvent.add) {
        date = DateTime(date.year + 1, date.month, date.day);
        debugPrint('Add Year $date');
      } else if (event == YearEvent.minus) {
        date = DateTime(date.year - 1, date.month, date.day);
        debugPrint('Minus Year$date');
      } else if (event == YearEvent.jump) {
        debugPrint('Jump Year $date');
      } else if (event == YearEvent.jump0) {
        date = DateTime.now();
        debugPrint('Jump 0 Year $date');
      }
      stateSink.add(date);
    });
  }
}
