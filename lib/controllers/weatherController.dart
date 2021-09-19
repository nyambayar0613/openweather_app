import 'package:get/get.dart';
import 'package:open_weather_app/models/weather.dart';

class WeatherController extends GetxController {
  static WeatherController instance = Get.find();

  Rx<WeatherResponse> weather =  new WeatherResponse().obs;

  setWeather(WeatherResponse data){
    weather.value = data;
  }

}