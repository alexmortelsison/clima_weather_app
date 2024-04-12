import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../location.dart';
import 'dart:convert';

const apiKey = "785bbc38e5ecd1a4507f8df8b366755e";

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
    getData();
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission permission2 = await Geolocator.checkPermission();

    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

// https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}
  void getData() async {
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      "lat": "44.34",
      "lon": "10.99",
      "appid": "785bbc38e5ecd1a4507f8df8b366755e"
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData["main"]["temp"];
      int condition = decodedData["weather"][0]["id"];
      String cityName = decodedData(data)["name"];

      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
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
