import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        loactionWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC0EEE4),
      body: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Image(
                image: AssetImage('images/weather_icon.jpg'),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SpinKitRing(
              color: Colors.blue,
              size: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}
