import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=23.26&lon=88.43&appid=a2b8ed23b446401728b0ea4960b0e00e'));
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      var temperature = jsonDecode(data)['main']['temp'];
      print(temperature);

      var conditionNumber = jsonDecode(data)['weather'][0]['id'];
      print(conditionNumber);

      var cityName = jsonDecode(data)['name'];
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Image(
            image: AssetImage('images/weather_icon.jpg'),
          ),
        ),
      ),
    );
  }
}
