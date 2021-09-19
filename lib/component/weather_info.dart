import 'package:flutter/material.dart';
import 'package:open_weather_app/models/weather.dart';

class WeatherInformation extends StatelessWidget {
  final WeatherResponse data;
  final String cityName;

  const WeatherInformation({Key key, this.data, this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (data != null)
          Column(
            children: [
              Image.network(data.iconUrl),
              Text(
                '${data.tempInfo.temperature}°',
                style: TextStyle(fontSize: 40),
              ),
              Text(data.weatherInfo.description)
            ],
          ),
        Text(''),
      ],
    );
  }
}
