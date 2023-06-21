import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/src/component/home_menu.dart';
import 'package:taxi_app/src/component/place_pick.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
class MapPage extends StatefulWidget {
  MapPage(this.globalKeyMyWidget);
  final GlobalKey globalKeyMyWidget;
  @override
  _MapPage createState() => _MapPage();

}

class _MapPage extends State<MapPage> {

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

    final  globalKeyMyWidget = GlobalKey<ScaffoldState>();

    final Completer<GoogleMapController> _mapController =  Completer<GoogleMapController>();
    final Map<String, Marker> _myMaker = {};
    final Set<Marker> _markerSet = {};


    static const LatLng initLocation1 = LatLng(10.813378533763371, 106.67424253867763);
    static const LatLng initLocation2 = LatLng(10.836428552465478, 106.65838560792592);
    static const LatLng initLocation3 = LatLng(10.844112878738494, 106.64020277210024);
    static const LatLng initLocation4 = LatLng(10.854021290438185, 106.6277532947818);

    BitmapDescriptor starMarkerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    BitmapDescriptor currentMarkerIcon = BitmapDescriptor.defaultMarker;
    BitmapDescriptor endMarkerIcon = BitmapDescriptor.defaultMarker;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(10.813378533763371, 106.67424253867763),
    zoom: 14.4746,
  );

  static const CameraPosition _getCurrentLocation = CameraPosition(
      bearing: 192.8334901395799,
      tilt: 59.440717697143555,
      target: LatLng(10.854021290438185, 106.6277532947818),
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
      infoWindow: const InfoWindow(title: "Cho hanh thong tay z"),
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

  void  _customerMarker() async {


    starMarkerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50,50)),
        'assets/icons/ic_user.png'
      );
    // currentMarkerIcon = await BitmapDescriptor.fromAssetImage(
    //       const ImageConfiguration(size: Size(50, 50)),
    //       'assets/icons/ic_phone.png'
    //   );
    currentMarkerIcon= await getBitmapDescriptorFromAssetBytes("assets/images/img_car_2.jpg", 400);
      await BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty,
          'assets/icons/ic_current.png').then((value) {
          endMarkerIcon = value;
      });
    endMarkerIcon= await getBitmapDescriptorFromAssetBytes("assets/icons/ic_user.png", 400);
    await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        'assets/icons/ic_current.png').then((value) {
      endMarkerIcon = value;
    });

      _markerSet.add(_showMarker1);
      _markerSet.add(_showMarker2);
      _markerSet.add(_showMarker3);
      _markerSet.add(_showMarker4);

      setState(() { });
    }

  @override
  void initState() {
    //
    _customerMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Stack(
      key: globalKeyMyWidget,
      children: [
        GoogleMap(
          mapType: MapType.normal,
          compassEnabled: false, //compass
          initialCameraPosition: _initialPosition,
          markers: _markerSet,
          onMapCreated: _onMapCreated,
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: GestureDetector(
            onTap: _goToCurrentLocation,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white,
              ),
              child: Image.asset('assets/icons/ic_user.png'),
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> _goToCurrentLocation() async {
    print("so ho la tap qqq");
    GoogleMapController controller = await _mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_getCurrentLocation));
    print("so ho la tap qqq");
  }
}

