import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/car_pick_bloc.dart';

class CarPick extends StatefulWidget {
  final int distance;
  CarPick(this.distance);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _CarState();
  }

}

class _CarState extends State<CarPick> {
  
  CarPickBloc carPickBloc = CarPickBloc();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return StreamBuilder(
      stream: carPickBloc.carPickStream,
      builder: (context, snapshot) {
        return Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(height: 140),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: ListView.builder(itemBuilder: (context, index) {
                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: carPickBloc.isSelected(index) ? Colors.black : null,
                  ),
                   onPressed: () {
                     carPickBloc.selectedCar(index);
                     print("55555555555555555555555555555 index: $index");
                  },
                   child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                            child: Text(
                              carPickBloc.carList!.elementAt(index).name,
                              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black45,
                          ),
                          width: 64,
                          height: 64,
                          child: Center(
                            child: Image.asset(carPickBloc.carList!.elementAt(index).photoCar),
                          ),
                        ),
                        Text("\$${carPickBloc.carList!.elementAt(index).price}", style: const TextStyle(color: Colors.orange, fontSize: 20),)
                      ],
                    ));
              },  itemCount: carPickBloc.carList!.length, scrollDirection: Axis.horizontal),
            ),
            Positioned(
              bottom: 48, right: 0, left: 0, height: 50,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Total (${_getDistanceInfo()}): ",
                      style: const TextStyle(fontSize: 18, color: Colors.black),),
                    Text("\$${_getTotal()}", style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),)
                  ],
                ),
              ),),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: 48,
                child: TextButton(onPressed: (){},
                  child: const Text("Đặt Xe", style: TextStyle(color: Colors.white, fontSize: 16),),),
              ),)
          ],
        );
      },
    );
  }


  String _getDistanceInfo() {
    double distanceInKM = widget.distance / 1000;
    return "$distanceInKM km";
  }

  double _getTotal() {
    double distanceInKM = widget.distance / 1000;
    return (distanceInKM * carPickBloc.getCurrentCar().price).toDouble();
  }

}