import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/place_picker.dart';

import 'building.dart';

class MapPage extends StatefulWidget {
  final Building building;

  MapPage(this.building);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGoogleLocation;
  CameraPosition _kGoogleInitLocation;
  @override
  void initState() {
    super.initState();

    _kGoogleLocation = CameraPosition(
      target: LatLng(double.parse(widget.building.latitude),
          double.parse(widget.building.longitude)),
      zoom: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.building.name, style: TextStyle(fontWeight: FontWeight.bold),)),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: (){}),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _kGoogleLocation,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
        showPlacePicker();
        },
        backgroundColor: Colors.white,
      ),
    );
  }

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker('AIzaSyAOiZTAxXn1nXH1EmYiyn_L999Kr3alicQ')));
  }
//  Future<void> _goToTheLake() async {
////    final GoogleMapController controller = await _controller.future;
////    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
////  }
}
