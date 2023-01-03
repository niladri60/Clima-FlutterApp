import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'a2b8ed23b446401728b0ea4960b0e00e';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'c🌩';
    } else if (condition < 400) {
      return 'c🌧';
    } else if (condition < 600) {
      return 'c☔️';
    } else if (condition < 700) {
      return 'c☃️';
    } else if (condition < 800) {
      return 'c🌫';
    } else if (condition == 800) {
      return 'c⛅';
    } else if (condition <= 804) {
      return 'c☁️';
    } else {
      return 'c🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 16) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
