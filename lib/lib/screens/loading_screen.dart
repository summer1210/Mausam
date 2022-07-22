import 'package:flutter/material.dart';

import 'package:mausam/lib/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/lib/services/weather.dart';

const apikey = '70db0e0fab5209a878ceeef69a40cac2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherdata = await weathermodel.getLocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white70,
          size: 100.0,
        ),
      ),
    );
  }
}
