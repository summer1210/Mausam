import 'package:mausam/lib/services/location.dart';
import 'package:mausam/lib/services/networking.dart';

const apikey = '70db0e0fab5209a878ceeef69a40cac2';
// https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$longg&appid=$apikey

class WeatherModel {
  Future<dynamic> getcityweather(var cityname) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=70db0e0fab5209a878ceeef69a40cac2&units=metric";
    NetworkHelper networkhelper = NetworkHelper(url);
    var weatherdata = await networkhelper.getdata();
    return weatherdata;
  }

  Future<dynamic> getLocationweather() async {
    location pos = location();
    await pos.getcurrentLoc();

    NetworkHelper networkhelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${pos.latt}&lon=${pos.longg}&appid=$apikey&units=metric');

    var weatherdata = await networkhelper.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
