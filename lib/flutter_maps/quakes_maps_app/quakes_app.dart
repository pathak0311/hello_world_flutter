import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_world/flutter_maps/quakes_maps_app/network/network.dart';

import 'model/quake.dart';

class QuakesApp extends StatefulWidget {
  const QuakesApp({Key key}) : super(key: key);

  @override
  _QuakesAppState createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  Future<Quake> _quakesData;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markerList = <Marker>[];
  double  _zoomVal = 5.0;

  @override
  void initState() {
    super.initState();
    _quakesData = Network().getAllQuakes();

    // _quakesData.then((value) => {
    //   print("Place: ${value.features[0].properties.place}")
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildGoogleMap(context),
          _zoomMinus(),
          _zoomPlus()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            findQuakes();
          },
          label: Text("Find Quakes")),
    );
  }

  Widget _zoomPlus() {
    return Padding(padding: EdgeInsets.only(top: 48.0),
    child: Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          _zoomVal++;
          print(_zoomVal);
          _plus(_zoomVal);
        },
        icon: Icon(FontAwesomeIcons.searchPlus, color: Colors.black87,),
      ),
    ),);
  }

  Widget _zoomMinus() {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            _zoomVal--;
            print(_zoomVal);
            _minus(_zoomVal);
          },
          icon: Icon(FontAwesomeIcons.searchMinus, color: Colors.black87,),
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(36.108333, -117.8608333), zoom: 2),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_markerList),
      ),
    );
  }

  void findQuakes() {
    setState(() {
      _markerList.clear();
      _handleResponse();
    });
  }

  void _handleResponse() {
    setState(() {
      _quakesData.then((quakes) => {
        quakes.features.forEach((quake) => {
          _markerList.add(Marker(
            markerId: MarkerId(quake.id),
            infoWindow: InfoWindow(title: quake.properties.mag.toString(),
                snippet: quake.properties.title),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
            position: LatLng(quake.geometry.coordinates[1], quake.geometry.coordinates[0]),
            onTap: () {},
          ))
        })
      });
    });
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)
    ));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)
    ));
  }
}
