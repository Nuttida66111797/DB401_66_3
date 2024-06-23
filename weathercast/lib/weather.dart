class Weather {
  final dynamic _weather; // _ อันเดอสกอคือ เป็นไพเวท สามารถใช้ได้แค่คนเดียวเท่านั้น
  final double temp;
  final String place;
// Weather(_weather: [1,2,3], temp: 35.0, place: 'aaa')
  Weather(this._weather, this.temp, this.place);

  String get condition => _weather['description'];
  //String get condition  {
  //  return_weather['description'];
  // }

  String get symbol => 'https://openweathermap.org/img/wn/${_weather["icon"]}@2x.png';
}