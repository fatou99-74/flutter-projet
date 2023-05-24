import 'package:flutter/material.dart';
import 'package:flutter_meteo_app_projet_dar23/utils/constants.dart';

import '../models/meteo_model.dart';

class MeteoProvider extends ChangeNotifier {
  List<MeteoModel> weatherList = [];
  int messageIndex = 0;
  int counter = 0;
  String message = '';
  bool loading = false;

  get getWeatherList => weatherList;
  get getMessageIndex => messageIndex;
  get getCounter => counter;
  get getMessage => messages[messageIndex];
  bool get isLoading => loading;

  set setWeatherList(List<MeteoModel> value) {
    weatherList = value;
    notifyListeners();
  }

  set setMessageIndex(int value) {
    messageIndex = value;
    notifyListeners();
    setMessage = messages[messageIndex];
    notifyListeners();
  }

  set setCounter(int value) {
    counter = value;
    notifyListeners();
  }


  set setMessage(String value) {
    message = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void reset() {
    setWeatherList = [];
    setMessageIndex = 0;
    setCounter = 0;
    setLoading(false);
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }


  void addWeatherList(MeteoModel value) {
    weatherList.add(value);
    notifyListeners();
  }

  void incrementMessageIndex(int value) {
    messageIndex += value;
    notifyListeners();
    setMessage = messages[messageIndex];
    notifyListeners();
  }

}
