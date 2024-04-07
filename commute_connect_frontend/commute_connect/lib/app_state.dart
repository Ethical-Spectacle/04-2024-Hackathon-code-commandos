import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }

  DateTime? _leaveTime;
  DateTime? get leaveTime => _leaveTime;
  set leaveTime(DateTime? value) {
    _leaveTime = value;
  }

  DateTime? _arriveTime;
  DateTime? get arriveTime => _arriveTime;
  set arriveTime(DateTime? value) {
    _arriveTime = value;
  }
}
