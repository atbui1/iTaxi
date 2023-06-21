import 'dart:async';

import 'package:taxi_app/src/utils/my_string.dart';
import 'package:taxi_app/src/validator/validation.dart';

import '../repository/place_service.dart';

class PlaceBloc{
  final StreamController _placeController = StreamController();


  Stream get placeStream => _placeController.stream;


  void searchPlace(String keyword) {
    print("step 1: call place bloc search: " + keyword);

    _placeController.sink.add("start");
    PlaceService.searchPlace(keyword).then((res) {
      _placeController.sink.add(res);
    }).catchError(() {
//      _placeController.sink.add("stop");
    });
  }

  void dispose() {
   _placeController.close();
  }
}