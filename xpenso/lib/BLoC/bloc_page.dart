import 'dart:async';
import 'package:xpenso/constans.dart';

enum SetPageEvent { setDateIndex, setMonthIndex, setYearIndex }

class SetPageBloc {
  final stateStreamController = StreamController<int>.broadcast();
  StreamSink<int> get stateSink => stateStreamController.sink;
  Stream<int> get stateStream => stateStreamController.stream;

  final eventStreamController = StreamController<SetPageEvent>.broadcast();
  StreamSink<SetPageEvent> get eventSink => eventStreamController.sink;
  Stream<SetPageEvent> get eventStream => eventStreamController.stream;

  SetPageBloc() {
    eventStream.listen((event) {
      if (event == SetPageEvent.setDateIndex) {
        durationIndex = 0;
      } else if (event == SetPageEvent.setMonthIndex) {
        durationIndex = 1;
      } else if (event == SetPageEvent.setYearIndex) {
        durationIndex = 2;
      }
    });
    stateSink.add(durationIndex);
  }
}
