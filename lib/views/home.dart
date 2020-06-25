import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//View for the Google Map
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraPosition _initialLocation;
  GoogleMapController mapController;
  final Geolocator _geolocator = Geolocator();
  Position _currentPosition;

  @override
  void initState() {
    _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
    _getCurrentLocation();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: <Widget>[GoogleMap(
         initialCameraPosition: _initialLocation,
         myLocationEnabled: true,
         myLocationButtonEnabled: false,
         mapType: MapType.normal,
         zoomGesturesEnabled: true,
         zoomControlsEnabled: false,
         onMapCreated: (GoogleMapController controller) {
           mapController = controller;
         },
       ),ClipOval(
         child: Material(
           color: Colors.orange[100], // button color
           child: InkWell(
             splashColor: Colors.orange, // inkwell color
             child: SizedBox(
               width: 56,
               height: 56,
               child: Icon(Icons.my_location),
             ),
             onTap: () {
               // TODO: Add the operation to be performed
               // on button tap
             },
           ),
         ),
       ),],
      ),
    );
  }
  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }
}