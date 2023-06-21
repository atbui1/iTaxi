import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/place_bloc.dart';
import 'package:taxi_app/src/screens/home_page.dart';
import 'package:taxi_app/src/screens/register_page.dart';

import '../model/place_item_res.dart';

class RidePickerPage extends StatefulWidget{
  final String selectedAddress;

  final Function(PlaceItemRes, bool) onSelected;
  final bool _isFromAddress;

  const RidePickerPage(this.selectedAddress, this.onSelected, this._isFromAddress, {super.key});


  @override
  State<StatefulWidget> createState() {
    return _RidePickerPage();
  }
}

class _RidePickerPage extends State<RidePickerPage> {
  PlaceBloc placeBloc = PlaceBloc();
  var _addressTextController = TextEditingController();
  List<Map<String, String>> listData = [
    {"name": "name 1", "value": "value of name 1"},
    {"name": "name 2", "value": "value of name 2"},
    {"name": "name 3", "value": "value of name 3"},
    {"name": "name 4", "value": "value of name 4"},
    {"name": "name 5", "value": "value of name 5"},
    {"name": "name 6", "value": "value of name 6"},
  ];

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
    // return ( MaterialApp(
    //   home: SafeArea(
    //   child: Scaffold(
    //    backgroundColor: Colors.white,
    //    appBar: AppBar(
    //      toolbarHeight: 50,
    //      leading: TextButton(
    //         onPressed: () {
    //           _backStack();
    //         },
    //         style: TextButton.styleFrom(
    //          backgroundColor: Colors.red,
    //        ),
    //        child: Image.asset("assets/icons/ic_arrow_left.png", color: Colors.white,),
    //      ),
    //    ),
    //       body: Container(
    //         constraints: const BoxConstraints.expand(),
    //         child: SingleChildScrollView(
    //           child: Column(
    //             // crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               //edit text place
    //               Container(
    //                 margin: const EdgeInsets.only(bottom: 10),
    //                 color: Colors.black12,
    //                 width: double.infinity,
    //                 height: 50,
    //                 child: Stack(
    //                   alignment: AlignmentDirectional.centerStart,
    //                   children: [
    //                     SizedBox(
    //                       width: 50,
    //                       height: 50,
    //                       child: Center(
    //                         child: Padding(
    //                           padding: const EdgeInsets.all(10),
    //                           child: GestureDetector(
    //                             onTap: (){
    //                               print('ssssssssssssssssssssss');
    //                               Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
    //
    //                             },
    //                               child: Image.asset('assets/icons/ic_location.png')),
    //                         ),
    //                       ),
    //                     ),
    //                     Positioned(
    //                         right: 0,
    //                         width: 50,
    //                         height: 50,
    //                         child: Center(
    //                           child: TextButton(
    //                             // padding: const EdgeInsets.all(15),
    //                             onPressed: (){ _clearText();},
    //                             child: Image.asset('assets/icons/ic_close.png',
    //                                 color: Colors.black12),
    //                           ),
    //                         )),
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 50, right: 50),
    //                       child: TextField(
    //                         decoration: const InputDecoration(
    //                           border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.all(Radius.circular(20)),
    //                               borderSide: BorderSide(
    //                                 color: Colors.cyanAccent,
    //                                 width: 1,
    //                               )
    //                           )
    //                         ),
    //                         style: const TextStyle(
    //                           fontSize: 17,
    //                           color: Colors.green
    //                         ),
    //                         controller: _addressTextController,
    //                         textInputAction: TextInputAction.search,
    //                         onSubmitted: (strPlace){
    //                           placeBloc.searchPlace(strPlace);
    //                         },
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 width: double.infinity,
    //                 height: 200,
    //                 color: Colors.black12,
    //                 child: ListView.separated(
    //                     itemCount: listData.length,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return ListTile(
    //                             leading: const Icon(Icons.list),
    //                             trailing: const Text(
    //                               "GPS ",
    //                               style: TextStyle(color: Colors.green, fontSize: 15),
    //                             ),
    //                             // onTap: (){
    //                             //   print('optap list test index: ${index + 1}');
    //                             //   Navigator.of(context).pop();
    //                             // },
    //
    //                         onTap: (){
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                               builder: (context) => HomePage(),
    //                               // builder: (context) => HomePage(todo: todos[index]),
    //                             ),
    //                           );
    //                         },
    //                             title: Text("List item ${index + 1}"),
    //                       );
    //                     },
    //                   separatorBuilder: (context, index) => const Divider(
    //                     height: 1,
    //                     color: Color(0xfff5f5f5),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 padding: const EdgeInsets.only(top: 20),
    //                 color: Colors.black12,
    //                 child: StreamBuilder(
    //                     stream: placeBloc.placeStream,
    //                     builder: (context, snapshot) {
    //                       if (snapshot.hasData) {
    //                         print('snapshot.data.toString() : ${snapshot.data.toString()}');
    //                         if (snapshot.data == "start") {
    //                           return const Center(
    //                             child: CircularProgressIndicator(),
    //                           );
    //                         }
    //
    //                         print('step - snapshot.data.toString(): ${snapshot.data.toString()}');
    //                         List<PlaceItemRes> placesListResponse = snapshot.data;
    //                         print('step - placesListResponse list: ${placesListResponse.length}');
    //                         print('step - placesListResponse detail: ${placesListResponse.elementAt(0)}');
    //                         return ListView.separated(
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) {
    //                               return ListTile(
    //                                 title: Text(placesListResponse.elementAt(index).name ?? 'null res1'),
    //                                 subtitle: Text(placesListResponse.elementAt(index).address ?? 'null res2'),
    //                                 onTap: () {
    //                                   print("RidePickerPage on tap index: ${index+100}");
    //                                   print("RidePickerPage on tap index 1: ${placesListResponse.elementAt(index).name}");
    //                                   print("RidePickerPage on tap index 2: ${widget._isFromAddress}");
    //
    //                                   Navigator.of(context).pop();
    //                                   widget.onSelected(placesListResponse.elementAt(index),
    //                                       widget._isFromAddress);
    //
    //                                   //   Navigator.push(context,
    //                                   //     MaterialPageRoute(
    //                                   //       builder: (context) => HomePage(),
    //                                   //     ),
    //                                   //   );
    //                                   // widget.onSelected(placesListResponse.elementAt(index),
    //                                   //     widget._isFromAddress);
    //
    //                                 },
    //                               );
    //                               },
    //                               separatorBuilder: (context, index) => const Divider(
    //                                 height: 10,
    //                                 color: Colors.red,
    //                               ),
    //                               itemCount: placesListResponse.length);
    //                               // itemCount: places.length);
    //                       } else {
    //                         return Container();
    //                       }
    //                     }),
    //               )
    //             ], // width: double.infinity,
    //             // height: double.infinity,
    //           ),
    //         ),
    //       ),
    //
    //     ),
    //   ),
    // ));

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
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //edit text place
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.black12,
                    width: double.infinity,
                    height: 50,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
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
                        Positioned(
                            right: 0,
                            width: 50,
                            height: 50,
                            child: Center(
                              child: TextButton(
                                // padding: const EdgeInsets.all(15),
                                onPressed: (){ _clearText();},
                                child: Image.asset('assets/icons/ic_close.png',
                                    color: Colors.black12),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.cyanAccent,
                                      width: 1,
                                    )
                                )
                            ),
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.green
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
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.black12,
                    child: ListView.separated(
                      itemCount: listData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "GPS ",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          // onTap: (){
                          //   print('optap list test index: ${index + 1}');
                          //   Navigator.of(context).pop();
                          // },

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                                // builder: (context) => HomePage(todo: todos[index]),
                              ),
                            );
                          },
                          title: Text("List item ${index + 1}"),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: Color(0xfff5f5f5),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    color: Colors.black12,
                    child: StreamBuilder(
                        stream: placeBloc.placeStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print('snapshot.data.toString() : ${snapshot.data.toString()}');
                            if (snapshot.data == "start") {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            print('step - snapshot.data.toString(): ${snapshot.data.toString()}');
                            List<PlaceItemRes> placesListResponse = snapshot.data;
                            print('step - placesListResponse list: ${placesListResponse.length}');
                            print('step - placesListResponse detail: ${placesListResponse.elementAt(0)}');
                            return ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(placesListResponse.elementAt(index).name ?? 'null res1'),
                                    subtitle: Text(placesListResponse.elementAt(index).address ?? 'null res2'),
                                    onTap: () {
                                      print("RidePickerPage on tap index: ${index+100}");
                                      print("RidePickerPage on tap index 1: ${placesListResponse.elementAt(index).name}");
                                      print("RidePickerPage on tap index 2: ${widget._isFromAddress}");

                                      Navigator.of(context).pop();
                                      widget.onSelected(placesListResponse.elementAt(index),
                                          widget._isFromAddress);

                                      //   Navigator.push(context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => HomePage(),
                                      //     ),
                                      //   );
                                      // widget.onSelected(placesListResponse.elementAt(index),
                                      //     widget._isFromAddress);

                                    },
                                  );
                                },
                                separatorBuilder: (context, index) => const Divider(
                                  height: 10,
                                  color: Colors.red,
                                ),
                                itemCount: placesListResponse.length);
                            // itemCount: places.length);
                          } else {
                            return Container();
                          }
                        }),
                  )
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