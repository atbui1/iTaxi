import 'package:taxi_app/src/model/step_res.dart';

class TripInfoRes{
  final int distance;
  final List<StepRes> steps;

  TripInfoRes(this.distance, this.steps);

}