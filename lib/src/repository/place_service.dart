import 'package:taxi_app/src/model/place_item_res.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../model/step_res.dart';
import '../utils/constant.dart';

/*
 * https://maps.googleapis.com/maps/api/place/textsearch/json?key=AIzaSyA6_tHnAcCpoYyR7tOBoIaoxoTfujnYwKo&language=vi&region=VN&query=30+tran+mao
 * https://maps.googleapis.com/maps/api/directions/json?origin=lat,lng&destination=lat,lng&sensor=false&mode=driving&key=AIzaSyA6_tHnAcCpoYyR7tOBoIaoxoTfujnYwKo
 * */

class PlaceService {

  static Future<List<PlaceItemRes>> searchPlace(String keyword) async {
     print("step 2: call place service with key gg api: $keyGoogle");
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/textsearch/json?key=$keyGoogle&language=vi&region=VN&query=${Uri.encodeQueryComponent(keyword)}");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return PlaceItemRes.fromJson(json.decode(response.body));
    } else {
      return PlaceItemRes.fromJson(<String, dynamic>{});
    }

  }

  static Future<dynamic> getStepRoute(double lat, double lng, double toLat, double toLng) async {
    String urlBasic = "https://maps.googleapis.com/maps/api/directions/";
    // origin of route
    String strOrigin = "origin=$lat,$lng";
    // Destination of route
    String strDest = "destination=$toLat,$toLng";
    // Sensor enabled
    String sensor = "sensor=false";
    String mode = "mode=driving";
    // Output format
    String output = "json";
    //str key
    String key = "key=$keyGoogle";
    // Building the parameters to the web service
    String parameters = "$strOrigin&$strDest&$sensor&$mode";

    // Building the url to the web service
    String url = "$urlBasic$output?$parameters&key=$keyGoogle";
    var qaz= Uri.parse(url);
    print("url call: $url");

    final JsonDecoder _decoder = new JsonDecoder();
    return http.get(qaz).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
//      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":$statusCode,\"message\":\"error\",\"response\":$res}";
        throw Exception(res);
      }

      List<StepsRes> steps = [];
      // TripInfoRes tripInfoRes;
      try {
        var json = _decoder.convert(res);
        int distance = json["routes"][0]["legs"][0]["distance"]["value"];
        steps = _parseSteps(json["routes"][0]["legs"][0]["steps"]);

        // tripInfoRes = new TripInfoRes(distance, steps);

      } catch (e) {
        throw Exception(res);
      }
      print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz $steps');
      return steps;
      // return tripInfoRes;
    });
  }

   static List<StepsRes> _parseSteps(final responseBody) {
     var list = responseBody
         .map<StepsRes>((json) => StepsRes.fromJson(json))
         .toList();

     print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj $list');
     return list;
   }
}
