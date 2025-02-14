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

  bool _homeSearchActive = false;
  bool get homeSearchActive => _homeSearchActive;
  set homeSearchActive(bool value) {
    _homeSearchActive = value;
  }

  bool _controlPanelPropertiesListSearchActive = false;
  bool get controlPanelPropertiesListSearchActive =>
      _controlPanelPropertiesListSearchActive;
  set controlPanelPropertiesListSearchActive(bool value) {
    _controlPanelPropertiesListSearchActive = value;
  }
}
