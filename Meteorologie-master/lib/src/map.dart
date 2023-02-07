import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:CertNodes/src/loginPage.dart';
import 'package:CertNodes/src/models/humidity_model.dart';
import 'package:CertNodes/src/models/luminosity_model.dart';
import 'package:CertNodes/src/service/logout_service.dart';
import 'package:CertNodes/src/service/meteo_service.dart';
import 'package:CertNodes/src/welcomePage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:CertNodes/src/display.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyMapPage extends StatefulWidget {
  @override
  MyMapPageState createState() => MyMapPageState();
}

class MyMapPageState extends State<MyMapPage> {
  // Declare a MapController field named 'mapController'
  late MapController mapController;

  // Declare a Position field named 'currentPosition'
  // and initialize it to the default position (0, 0)
  Position currentPosition = Position(
      longitude: 30.891738,
      latitude: 10.1764236,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);
  Position tappedPosition = Position(
      longitude: 30.891738,
      latitude: 10.1764236,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);

  // This method asynchronously determines the current position of the device
  // using the Geolocator package and updates the 'currentPosition' field
  // with the new position.
  Future<void> updateCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      currentPosition = position;
      mapController.move(
          LatLng(currentPosition.latitude, currentPosition.longitude), 16.0);
    });
  }

  @override
  void initState() {
    // Initialize the map controller and update the current position

    mapController = MapController();
    updateCurrentPosition();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff7892b),
        title: Text("My Map"),
        actions: [
          Row(
            children: [
              Text("Logout"),
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                tooltip: 'Logout',
                onPressed: () async {
                  // LogoutService().logout().then((value) {
                  //   if (value == true) {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => LoginPage()));
                  //   }
                  // });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
              )
            ],
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: FlutterMap(
        // Assign the map controller to the Flutter Map widget
        mapController: mapController,
        options: MapOptions(
          // Center the map on the current position
          center: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point:
                    LatLng(currentPosition.latitude, currentPosition.longitude),
                builder: (ctx) => InkWell(
                  child: Container(
                    child: Icon(Icons.account_circle),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(
                            "Longitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}"),
                      ),
                    );
                  },
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(36.89354826097406, 10.189031271078212),
                builder: (ctx) => InkWell(
                  child: Container(
                    child: Icon(Icons.sunny_snowing),
                  ),
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Container(
                          height: 190,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: FutureBuilder(
                                    future: WelcomePage.dataFetch(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState
                                              .waiting) //While waiting for response return this
                                      {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      return Column(
                                        children: [
                                          Text(
                                              "Date: ${WelcomePage.finalLuminosity[0][0]}\nLongitude: ${36.89354826097406}\nLatitude: ${10.189031271078212}\nTemperature: ${WelcomePage.finalTemperature[1][WelcomePage.finalLuminosity[0][20]]}\nHumidity: ${WelcomePage.finalHumidity[1][WelcomePage.finalHumidity[0][0]]}\nLuminosity: ${WelcomePage.finalLuminosity[1][WelcomePage.finalLuminosity[0][0]]}\nPressure: ${WelcomePage.finalPressure[1][WelcomePage.finalPressure[0][20]]}"),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color.fromARGB(
                                                            255, 251, 180, 72)),
                                              ),
                                              onPressed: () => {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Display())),
                                                  },
                                              child: Text("Show more details"))
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController.move(
              LatLng(currentPosition.latitude, currentPosition.longitude),
              16.0);
        },
        child: Icon(Icons.my_location),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) => AlertDialog(
      //         content: Text(
      //             "Longitude: ${tappedPosition.latitude}\nLatitude: ${tappedPosition.longitude}"),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
