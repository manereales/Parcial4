import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late GoogleMapController _controller;

  List<Marker> _markers = [];

  void _onMapCreated(GoogleMapController controller) {
    _markers.add(
      Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(13.476279086927303, -88.17695967942899),
        infoWindow: InfoWindow(
          title: "San Miguel",
          snippet: "Telollevo SV cuenta con una sucursal en San Miguel",     
        ),
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId("id-2"),
        position: LatLng(13.334080, -88.443915),
        infoWindow: InfoWindow(
          title: "Usulutan",
          snippet: "Telollevo SV cuenta con una sucursal en Usulutan",
          
        ),
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId("id-3"),
        position: LatLng(13.782116, -88.144576),
        infoWindow: InfoWindow(
          title: "Morazan",
         snippet: "Telollevo SV cuenta con una sucursal en Morazán",
        ),
      ),
    );


    _markers.add(
      Marker(
        markerId: MarkerId("id-4"),
        position: LatLng(13.338626, -87.853645),
        infoWindow: InfoWindow(
          title: "La Union",
          snippet: "Telollevo SV cuenta con una sucursal en La Unión",
          
        ),
      ),
    );


    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers.map((e) => e).toSet(),
        initialCameraPosition:
            CameraPosition(target: LatLng(13.476279086927303, -88.17695967942899), zoom: 10),
        mapType: MapType.normal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),


    );
  }
}