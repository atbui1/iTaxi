import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/src/component/car_pick.dart';
import 'package:taxi_app/src/component/home_menu.dart';
import 'package:taxi_app/src/component/place_pick.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:taxi_app/src/model/trip_info_res.dart';
import '../model/place_item_res.dart';
import '../model/step_res.dart';
import '../repository/place_service.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
    final  _scaffoldKey = GlobalKey<ScaffoldState>();
    final Completer<GoogleMapController> _mapController =  Completer<GoogleMapController>();
    final Set<Marker> _markerSet = {};
    final Map<String, Marker> _markersQAZ = {};

    final Set<Polyline> _polylineSet = {};
    var _tripDistance = 0;


     LatLng initLocation1 = const LatLng(10.813378533763371, 106.67424253867763);
     LatLng initLocation2 = const LatLng(10.836428552465478, 106.65838560792592);
     LatLng initLocation3 = const LatLng(10.844112878738494, 106.64020277210024);
     LatLng initLocation4 = const LatLng(10.854021290438185, 106.6277532947818);

    BitmapDescriptor starMarkerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    BitmapDescriptor currentMarkerIcon = BitmapDescriptor.defaultMarker;
    BitmapDescriptor endMarkerIcon = BitmapDescriptor.defaultMarker;


    Future<Uint8List?> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
    }

    Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(String path, int width) async {
      final Uint8List? imageData = await getBytesFromAsset(path, width);
      return BitmapDescriptor.fromBytes(imageData!);
    }

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(10.813378533763371, 106.67424253867763),
    zoom: 14.4746,
  );

  static const CameraPosition _getCurrentLocation = CameraPosition(
      bearing: 192.8334901395799,
      tilt: 59.440717697143555,
      target: LatLng(10.813378533763371, 106.67424253867763),
      zoom: 14.151926040649414);

  final CameraPosition _getCurrentLocationTest = const CameraPosition(
        bearing: 192.8334901395799,
        tilt: 59.440717697143555,
        target: LatLng(10.844112878738494, 106.64020277210024),
        zoom: 14.151926040649414);

    _onMapCreated(GoogleMapController controller) {
      _mapController.complete(controller);
    }

    late final Marker _showMarker1 =  Marker(
    markerId: const MarkerId("initial 1"),
    position: initLocation1,
    icon: starMarkerIcon,
    infoWindow: const InfoWindow(title: "CV gia dinh q"),
  );
    late final Marker _showMarker2 =  Marker(
      markerId: const MarkerId("initial 2"),
      position: initLocation2,
      icon: currentMarkerIcon,
      infoWindow:  const InfoWindow(title: "Cho hanh thong tay z",snippet: 'sssss'),//, onTap: qaz),
    );
    late final Marker _showMarker3 =  Marker(
      markerId: const MarkerId("initial 3"),
      position: initLocation3,
      icon: currentMarkerIcon,
      infoWindow: const InfoWindow(title: "pham van chieu"),
    );
    late final Marker _showMarker4 =  Marker(
      markerId:  const MarkerId("initial 4"),
      position: initLocation4,
      icon: endMarkerIcon,
      infoWindow: const InfoWindow(title: "CV Quang Trung a"),
    );

    _customerMarker() async {
    print('11111111111111111111111111111111111111111111');
    starMarkerIcon= await getBitmapDescriptorFromAssetBytes("assets/images/img_car_1.jpg", 300);
    currentMarkerIcon = await getBitmapDescriptorFromAssetBytes("assets/icons/ic_arrive.png", 100);
    endMarkerIcon = await getBitmapDescriptorFromAssetBytes("assets/icons/ic_location.png", 100);
    _markerSet.add(_showMarker1);
    _markerSet.add(_showMarker2);
    _markerSet.add(_showMarker3);
    _markerSet.add(_showMarker4);
    setState(() { });
    }

    @override
    void initState() {
      // TODO: implement initState
      // _customerMarker();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: HomeMenu(),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          // margin: const EdgeInsets.all(30),
          child: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                //enable Zoom in, out on map
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapToolbarEnabled: false,
                // open gg map
                compassEnabled: false,
                //compass
                initialCameraPosition: _initialPosition,
                // markers: _markerSet,
                markers: Set.of(_markersQAZ.values),
                polylines: _polylineSet,
                onMapCreated: _onMapCreated,
              ),
              //     MapPage(_scaffoldKey),
              Positioned(
                left: 10,
                top: 10,
                right: 10,
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      toolbarHeight: 40,
                      elevation: 0.0,
                      centerTitle: true,
                      title: const Text("iTaxi",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w800)),
                      leading: TextButton(
                        onPressed: () {
                          print("click open home menu");
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Image.asset('assets/icons/ic_menu_1.png'),
                      ),
                      actions: [
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/icons/ic_notify.png')),
                      ],
                    ),
                    PlacePick(onPlaceSelected),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: GestureDetector(
                  onTap: _goToCurrentLocation,
                  // onTap: _moveCamera,
                  child: Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/icons/ic_current.png'),
                  ),
                ),
              ),
              _polylineSet.isNotEmpty ?
              Positioned(left: 20, right: 20, bottom: 40,
                height: 248,
                child: CarPick(_tripDistance),
              ) :
              Positioned(left: 20, right: 20, bottom: 40,
                child: Container(color: Colors.yellow,),
              )
              // Positioned(left: 20, right: 20, bottom: 40,
              //   height: 248,
              //   child: CarPick(_tripDistance),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    print("so ho la tap 000");
    GoogleMapController controller = await _mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_getCurrentLocation));
    print("so ho la tap 111");
  }

  /** component pick location */
  onPlaceSelected(PlaceItemRes place, bool fromAddress) {
    var mkId = fromAddress ? "from_address" : "to_address";
    //add marker into set
    // _addMarker(mkId, place);
    // _moveCamera();

    //add marker into Map
    _addMarkerQAZ(mkId, place);
    _moveCameraQAZ();

    _checkDrawPolyline();
  }

  /** 1. add marker and move camera */
  void _addMarker(String mkId, PlaceItemRes place) {
    _markerSet.add(Marker(
      markerId: MarkerId(mkId),
      position: LatLng(place.lat, place.lng),
      icon: mkId == "from_address"
          ? BitmapDescriptor.defaultMarker
          : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title: place.name),
    ));
    setState(() {});
  }
  Future<void> _moveCamera() async {
    if (_markerSet.isEmpty) {
      GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: initLocation1,
          zoom: 14.4746,
        ),
      ));
      print("move camera null 111111111111111111111111111111111111111111");
    } else {
      GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _markerSet.elementAt(_markerSet.length - 1).position,
          zoom: 14.4746,
        ),
      ));
      print(
          "move camera123not null 22222222222222222222222222222222222222222222222");
    }
  }

  /** 2. add marker and move camera */
    void _addMarkerQAZ(String mkId, PlaceItemRes place) {
    _markersQAZ.remove(mkId);

    _markersQAZ[mkId] = Marker(
      markerId: MarkerId(mkId),
      position: LatLng(place.lat, place.lng),
      icon: mkId == "from_address"
          ? BitmapDescriptor.defaultMarker
          : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title: place.name),
    );

    print('ttttttttttttttttttttttttttttttttttttttttt $_markersQAZ');

    setState(() {});
  }

  Future<void> _moveCameraQAZ() async {
    if (_markersQAZ.isEmpty) {
      GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: initLocation1,
          zoom: 14.4746,
        ),
      ));
      print("move camera null 111111111111111111111111111111111111111111");
    } else {
      GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          // target: _markerSet.elementAt(_markerSet.length - 1).position,
          target: _markersQAZ.values.elementAt(_markersQAZ.length - 1).position,
          zoom: 14.4746,
        ),
      ));
      print(
          "move camera123not null 22222222222222222222222222222222222222222222222");
    }
  }

  _checkDrawPolyline()  {
    // _polylineSet.clear();
      if(_markersQAZ.length > 1) {
        var from = _markersQAZ["from_address"]?.position;
        var to = _markersQAZ["to_address"]?.position;
        PlaceService.getStepRoute(from!.latitude, from.longitude, to!.latitude, to.longitude)
        .then((value)  {
        print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk: $value');
        /** get trip info from service*/
        TripInfoRes tripInfoRes = value;
        print('zzzzzzzzzzzzzzzzzzzzzzzzzzzz distance: ${tripInfoRes.distance}');
        _tripDistance = tripInfoRes.distance;
        List<StepRes> stepResList = tripInfoRes.steps;
        List<LatLng> stepPaths = [];
        for (var element in stepResList) {
          stepPaths.add(LatLng(element.startLocation.latitude, element.startLocation.longitude));
          stepPaths.add(LatLng(element.endLocation.latitude, element.endLocation.longitude));
        }

          /** add polyLinePoint */
        setState(() {
          _polylineSet.add(Polyline(
              polylineId: const PolylineId('route'),
              points: stepPaths,
              width: 4,
              color: Colors.greenAccent));

        });
        });
      }
      print('99999999999999999999999999999999999999999999999999999: ${_polylineSet.length}');
    // setState(() {});
  }

}


