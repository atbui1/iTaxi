import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/src/component/home_menu.dart';
import 'package:taxi_app/src/component/place_pick.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import '../model/place_item_res.dart';
import 'map_page.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<StatefulWidget> createState() {

    return _ShowPage();

  }

}


class _ShowPage extends State<ShowPage> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return (
        MaterialApp(
            home: SafeArea(
              child: Scaffold(
                drawer: Drawer(
                  child: HomeMenu(),
                ),
                body: Container(
                  constraints: const BoxConstraints.expand(),
                  // margin: const EdgeInsets.all(30),
                  child:  Stack(
                    children: <Widget>[
                      GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(37.42796133580664, -122.085749655962),
                          zoom: 14.4746,
                        ),
                        // onMapCreated: (GoogleMapController controller) {
                        //   _controller.complete(controller);
                        // },
                      ),
                    ],
                  ),
                ),
              ),

            ))
    );
  }

  // Future<void> _goToCurrentLocation() async {
  //   print("so ho la tap 000");
  //   GoogleMapController controller = await _mapController.future;
  //   controller
  //       .animateCamera(CameraUpdate.newCameraPosition(_getCurrentLocation));
  //   print("so ho la tap 111");
  //
  // }


}

