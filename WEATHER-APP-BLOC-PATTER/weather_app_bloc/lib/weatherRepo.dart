import 'package:api_call_bloc_pattern/weatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRepo {
  Future<WeatherModel> getWeather(String cityName) async {
    //String url =
    //"https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=43ea6baaad7663dc17637e22ee6f78f2";
    final result = await http.Client().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=43ea6baaad7663dc17637e22ee6f78f2");

    if (result.statusCode != 200) {
      throw Exception();
    }
    return parsedJson(result.body);
  }

  //return weather model of json we have parsed from receiving response from http call
  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}

/*
https://jsonformatter.curiousconcept.com/
{
"coord":{
"lon":73.86,
"lat":18.52
},
"weather":[
{
"id":501,
"main":"Rain",
"description":"moderate rain",
"icon":"10d"
}
],
"base":"stations",
"main":{
"temp":300.49,
"feels_like":303.67,
"temp_min":300.49,
"temp_max":300.49,
"pressure":1008,
"humidity":67,
"sea_level":1008,
"grnd_level":946
},
"visibility":6811,
"wind":{
"speed":1.19,
"deg":295
},
"rain":{
"1h":2.58
},
"clouds":{
"all":26
},
"dt":1603536012,
"sys":{
"country":"IN",
"sunrise":1603501267,
"sunset":1603542965
},
"timezone":19800,
"id":1259229,
"name":"Pune",
"cod":200
}*/
