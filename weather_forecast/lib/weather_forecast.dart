import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/weather_model.dart';



Future<List<Weather_Model>> fetchWeather(http.Client client) async {
  const String key = 'f3eae70c30414c12968133803222601';
  String city = 'khulna';
  final response = await client
      .get(
      Uri.parse(
          'https://api.weatherapi.com/v1/forecast.json?key='
              +key
              +'&q='
              +city
              +'&days=7&aqi=no&alerts=no'
      ));
 //print(response.body)
  //var parsed;
  //return compute( (parsed.map<Weather_Model>((json) => Weather_Model.fromJson(json)).toList()), response.body);
  return compute(parseWeather, response.body);

}

List<Weather_Model> parseWeather(String responseBody){
  print(responseBody);
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Weather_Model>((json) => Weather_Model.fromJson(json)).toList();
}

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
      ),
      body: FutureBuilder<List<Weather_Model>>(
        future: fetchWeather(http.Client()),
        builder: (context, snapshot){
            if (snapshot.hasError) {
                 return const Center(
                 child: Text('An error has occurred!'),
                );
           } else
              //return WeatherList(data: snapshot.data!);
              if (snapshot.hasData) {
                  return WeatherList(data: snapshot.data!);
            } else {
                  return const Center(
                  child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class WeatherList extends StatelessWidget {
  const WeatherList({Key? key, required this.data}) : super(key: key);
  final List<Weather_Model> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(height: 5.0,),
                ListTile(
                  title: Text("Location: ${data[index].current?.isDay}"),
                )
              ],
            );
          }),
    );
  }
}

