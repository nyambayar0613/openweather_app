import 'package:flutter/material.dart';
import 'package:open_weather_app/component/weather_info.dart';
import 'package:open_weather_app/models/weather.dart';
import 'package:open_weather_app/controllers/weatherController.dart';
import 'package:get/get.dart';
class DetailScreen extends StatelessWidget {
  final WeatherResponse response;
  final String cityName;
  DetailScreen({Key key, this.response, this.cityName}) : super(key: key);
  final WeatherController _weatherController = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    print(cityName);
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            _weatherController.setWeather(this.response);
            Get.back();
          },
        ),
      ),
      body: Center(
        child: WeatherInformation(data:this.response, cityName:this.cityName),
      ),
    );
  }
}
