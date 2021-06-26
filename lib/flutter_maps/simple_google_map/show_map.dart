import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  const ShowSimpleMap({Key key}) : super(key: key);

  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {

  GoogleMapController mapController;
  static LatLng _center = const LatLng(-34, 151);
  static LatLng _anotherLocation = const LatLng(-34.10001, 151.10001);

  void _onMapCreated(GoogleMapController googleMapController) {
    mapController = googleMapController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: GoogleMap(
        markers: { portlandMarker, anotherMarker},
        mapType: MapType.hybrid,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _anotherLocation, zoom: 11.0),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: _goToIntel,
          label: Text("Intel Coorp!"),
      icon: Icon(Icons.place),
      ),
    );
  }

  Marker portlandMarker = Marker(markerId: MarkerId("portland"),
    position: _center,
    infoWindow: InfoWindow(title: "Portland", snippet: "abc"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
  );

  Marker anotherMarker = Marker(markerId: MarkerId("portland"),
      position: _anotherLocation,
      infoWindow: InfoWindow(title: "Portland 2", snippet: "abc"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
  );

  static final CameraPosition intelPosition = CameraPosition(
      target: LatLng(45.5418295, -122.9170456),
      bearing: 191.789,
      tilt: 34.89,
      zoom: 14.780);

  Future<void> _goToIntel() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));

  }
}
