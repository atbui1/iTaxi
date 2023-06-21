
import 'package:flutter/material.dart';
import 'package:taxi_app/src/screens/ride_picker_page.dart';

import '../model/place_item_res.dart';

class RidePicker extends StatefulWidget {

  final Function(PlaceItemRes, bool) onSelected;
  RidePicker(this.onSelected);

  @override
  State<StatefulWidget> createState() {
    // throw UnimplementedError();
    return _RidePicker();
  }


  // @override
  // _RidePicker createState() => _RidePicker();
}

class _RidePicker extends State<RidePicker> {

    PlaceItemRes? fromAddressQAZ;
    PlaceItemRes? toAddressQAZ;

  @override
  void initState() {
      print("5555555555555555555555555555555555555555555555555555555555555555555555:");
      print("55 000000000000: ${widget.onSelected}");
      print('55 1111111111111: $fromAddressQAZ');
      print('55 22222222222222: $toAddressQAZ');
      print('55 33333333333333: $toAddressQAZ');
      if (fromAddressQAZ != null) {

      } else {
        print("RidePicker fromData null 11");

      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return (
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          // BoxShadow(color: Colors.black, offset: Offset(0,2), blurRadius: 2)
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // form get departure place
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RidePickerPage(
                        // {fromAddressQAZ!.name} == null ? "from null" : 'fromAddressQAZ!.name',
                        fromAddressQAZ == null ? "sc" : fromAddressQAZ!.name,
                        // fromAddressQAZ == null ? "" : fromAddressQAZ!.name,
                            (place, isFrom) {
                          widget.onSelected(place, isFrom);
                          fromAddressQAZ = place;
                          print('555 aaaaaaaaaaaa: ${fromAddressQAZ!.name}');
                          print('555 111 aaaaaa: $place');
                          print('555 bbbbbbbbbbbb: $isFrom');
                          print('555 ccccccccccccccc: ${place.name}');
                          setState(() {});
                        }, true)));

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => RidePickerPage("Cong vien phan mem quang trung", (place, isForm){
                //       widget.onSelected(place, isForm);
                //     }, true))
                // );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 10,
                  shadowColor: Colors.green.withOpacity(0.5),
              ),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(child: Image.asset('assets/icons/ic_location.png'),),
                    ),
                    Positioned(
                        right: 0,
                        width: 15,
                        height: 15,
                        child: Center(child: Image.asset('assets/icons/ic_close.png', color: Colors.black12),)
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Text(
                        fromAddressQAZ == null ? "From Location qaz null" : fromAddressQAZ!.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // form get destination place
          SizedBox(
            width: double.infinity,
            height: 50,
            // padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: (){
                print("_goToChoicePlaceEnd");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RidePickerPage(
                        toAddressQAZ == null ? "" : toAddressQAZ!.name,
                            (place, isFrom) {
                          widget.onSelected(place, isFrom);
                          toAddressQAZ = place;
                          setState(() {});
                        }, false)));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 10,
                  shadowColor: Colors.green.withOpacity(0.5),
              ),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  // alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(child: Image.asset('assets/icons/ic_arrive.png')),
                    ),
                    Positioned(
                        right: 0,
                        width: 15,
                        height: 15,
                        child: Center(child: Image.asset('assets/icons/ic_close.png', color: Colors.black12),)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Text(
                        // "cong vien gia dinh phu nhuan",
                        toAddressQAZ == null ? "ToLocation" : toAddressQAZ!.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
   void _testPop() {
      print('back ride back back ...');
      // Navigator.pop(context);
      Navigator.pop(context);
    }

  void _goToChoicePlaceStar() {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => RidePickerPage(
    //         fromAddress == null ? "" : fromAddress.name,
    //             (place, isFrom) {
    //           widget.onSelected(place, isFrom);
    //           fromAddress = place;
    //           setState(() {});
    //         }, true)));

    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => RidePickerPage())
    // );
  }

}