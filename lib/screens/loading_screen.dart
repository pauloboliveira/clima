import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = 'apiKey';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late var lat;
  late var lon;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();
    lat = location.latitude;
    lon = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('api.openweathermap.org', 'data/2.5/weather', {'lat': lat.toString(), 'lon' : lon.toString(), 'apiKey' : apiKey});

    var weatherData = await networkHelper.getData();
    getData();
  }

  void getData() async {

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
