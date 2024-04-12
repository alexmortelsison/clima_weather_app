import 'package:clima_weather_app/services/networking.dart';
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
  late double latitude;
  late double longitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission permission2 = await Geolocator.checkPermission();

    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
