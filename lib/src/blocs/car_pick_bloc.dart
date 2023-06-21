import 'dart:async';

import 'package:taxi_app/src/model/car_item.dart';
import 'package:taxi_app/src/model/car_set_data.dart';

class CarPickBloc {
  final StreamController _carPickController = StreamController();

  Stream get carPickStream => _carPickController.stream;

  var carList = CarSetData.getSetDataCarList();

  var currentSelected = 0;
  void selectedCar(int positions) {
    currentSelected = positions;
    _carPickController.sink.add(currentSelected);
  }

  bool isSelected(int positions) {
    return currentSelected == positions;
  }

  CarItem getCurrentCar() {
    return carList!.elementAt(currentSelected);
  }

  void disPose() {
    _carPickController.close();
  }
}