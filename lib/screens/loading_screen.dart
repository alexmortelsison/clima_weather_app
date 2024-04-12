import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission permission2 = await Geolocator.checkPermission();

    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
