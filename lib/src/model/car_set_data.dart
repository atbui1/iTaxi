import 'package:taxi_app/src/model/car_item.dart';

class CarSetData {
  static List<CarItem>? carList;
  static List<CarItem>? getSetDataCarList() {
    if(carList != null) {
      return carList;
    }

    // carList =  List<CarItem>();
    carList =  [];

    carList?.add(CarItem("bwm", "assets/images/img_car_1.jpg", 10));
    carList?.add(CarItem("camry", "assets/images/img_car_1.jpg", 15));
    carList?.add(CarItem("honda", "assets/images/img_car_1.jpg", 17));
    carList?.add(CarItem("mercedes", "assets/images/img_car_1.jpg", 20));

    return carList;
  }
}