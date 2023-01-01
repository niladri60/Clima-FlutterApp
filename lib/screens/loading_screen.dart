import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocation();
  }
  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    if (kDebugMode) {
      print(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
