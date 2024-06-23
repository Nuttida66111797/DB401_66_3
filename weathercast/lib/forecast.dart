import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const String key = 'c5002dd885696a26f2ea5690df2677cd';
  try {
    Position location = await getCurrentLocation();
    Uri api = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&lang=th&appid=$key');
    http.Response response = await http.get(
      api,
      headers: {
         'accept': 'application/json'
      }
    );
    if(response.statusCode == 200) {
      var result = jsonDecode(response.body);
      var weather = result['weather'][0];
      double temp = result['main']['temp'];
      String place = result['name'];
      return Weather(weather, temp, place);
    } else {
      return Future.error(response.toString());
}
  } catch (e) {
    return Future.error(e.toString());
  }
}