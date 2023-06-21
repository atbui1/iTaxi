import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/place_bloc.dart';
import 'package:taxi_app/src/screens/home_page.dart';
import 'package:taxi_app/src/screens/register_page.dart';

import '../model/place_item_res.dart';

class PlacePickPage extends StatefulWidget{
  final String selectedAddress;

  final Function(PlaceItemRes, bool) onSelected;
  final bool _isFromAddress;

  const PlacePickPage(this.selectedAddress, this.onSelected, this._isFromAddress, {super.key});


  @override
  State<StatefulWidget> createState() {
    return _PlacePickState();
  }
}

class _PlacePickState extends State<PlacePickPage> {
  PlaceBloc placeBloc = PlaceBloc();
  var _addressTextController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    _addressTextController = TextEditingController(text: widget.selectedAddress);

    print('_addressTextController: ${_addressTextController.text}');
    print('_isFromAddress: ${widget._isFromAddress}');



    print('444 11111111111111: ${widget.selectedAddress}');
    print('444 2222222222222: ${widget.onSelected}');
    print('444 3333333333333333: ${widget._isFromAddress}');

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    placeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 50,
            leading: TextButton(
              onPressed: () {
                _backStack();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Image.asset("assets/icons/ic_arrow_left.png", color: Colors.white,),
            ),
            centerTitle: true,
            title:  Text(widget._isFromAddress ? "Chọn nơi xuất phát" : "Chọn nơi đến",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /** nav text location */
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    width: double.infinity,
                    height: 50,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        /** icon location */
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                  onTap: (){
                                    print('ssssssssssssssssssssss');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));

                                  },
                                  child: Image.asset('assets/icons/ic_location.png')),
                            ),
                          ),
                        ),
                        /** icon notification */
                        Positioned(
                            right: 0,
                            width: 50,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextButton(
                                  onPressed: (){ _clearText();},
                                  child: Image.asset('assets/icons/ic_close.png',
                                      color: Colors.black12),
                                ),
                              ),
                            )),
                        /** text address location */
                        Padding(
                          // padding: const EdgeInsets.only(left: 50, right: 50),
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: TextField(
                            decoration: const InputDecoration(
                              /** over text */
                              isDense: true,
                              contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                              hintText: "Enter place...",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.cyanAccent,
                                    width: 1,
                                  ))),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            fontWeight: FontWeight.w400,
                            ),
                            controller: _addressTextController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (strPlace){
                              placeBloc.searchPlace(strPlace);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  /** list item row place */
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    color: Colors.amberAccent,
                    child: StreamBuilder(
                        stream: placeBloc.placeStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print('snapshot.data.toString() : ${snapshot.data
                                .toString()}');
                            if (snapshot.data == "start") {
                              // return const Center(
                              //   child: CircularProgressIndicator(),
                              // );
                              return Container(
                                height: 300,
                                color: Colors.red,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            List<PlaceItemRes> placesListResponse = snapshot.data;

                            return ListView.separated(
                              primary: false,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(placesListResponse
                                        .elementAt(index)
                                        .name ?? 'null res1'),
                                    subtitle: Text(placesListResponse
                                        .elementAt(index)
                                        .address ?? 'null res2'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      widget.onSelected(
                                          placesListResponse.elementAt(index),
                                          widget._isFromAddress);
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                const Divider(
                                  height: 10,
                                  color: Colors.red,
                                ),
                                itemCount: placesListResponse.length);
                          } else {
                            return Container(
                              height: 200,
                              // height: double.infinity,
                              color: Colors.greenAccent,
                            );
                          }
                        }),
                  ),
                ], // width: double.infinity,
                // height: double.infinity,
              ),
            ),
          ),

        ),
      );
  }

  void _backStack() {
    print("back stack");
    Navigator.of(context).pop();
  }
   void _clearText() {
     print("clear text stack");
     _addressTextController.text = "";
   }


  listTestFunction() {
     ListView.builder(
         itemCount: 5,
         itemBuilder: (BuildContext context, int index) {
           return ListTile(
               leading: const Icon(Icons.list),
               trailing: const Text(
                 "GFG 1",
                 style: TextStyle(color: Colors.green, fontSize: 15),
               ),
               title: Text("List item $index"));
         });
   }
}