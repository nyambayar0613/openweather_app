import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_app/component/search_widget.dart';
import 'package:open_weather_app/data/city_data.dart';
import 'package:open_weather_app/screens/detail_screen.dart';
import 'package:open_weather_app/services/data_service.dart';
import '../cities.dart';
import 'package:open_weather_app/models/weather.dart';
import 'package:open_weather_app/controllers/weatherController.dart';
import 'package:get/get.dart';
import 'package:open_weather_app/component/weather_info.dart';

class MainScreen extends StatefulWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Cities> cities;
  String query = '';

  final WeatherController _weatherController = Get.put(WeatherController());
  final _dataService = DataService();

  showDetail(String cityCode, String location) async {
    WeatherResponse response = await _dataService.getWeather(cityCode);

    Get.to(DetailScreen(
      response: response,
      cityName: location,
    ));
  }

  @override
  void initState() {
    super.initState();

    cities = allCity;
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Хотын нэрээ оруулна уу',
    onChanged: searchCity,
  );

  Widget buildCities(Cities city) =>
      ListTile(
        onTap: () {
          showDetail(city.cityCode, city.location);
        },
        title: Text(city.location),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/${city.flag}'),
        ),
      );

  void searchCity(String query) {
    final cities = allCity.where((city) {
      final cityNameLower = city.location.toLowerCase();
      final searchLower = query.toLowerCase();

      return cityNameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.cities = cities;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_weatherController.weather.value.cityName);
    return Scaffold(
      appBar: AppBar(
        title: Text('Хотуудын жагсаалт'),
        centerTitle: true,
      ),
      body: Obx(
        () =>
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 10.0,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Test",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _weatherController.weather.value.cityName != "" &&
                      _weatherController.weather.value.cityName != null
                      ? WeatherInformation(data: _weatherController.weather.value, cityName: _weatherController.weather.value.cityName)
                      : Container(),
                  buildSearch(),
                  SizedBox(height: 10),
                  Flexible(
                    child: ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: (context, index) {
                        final city = cities[index];
                        return Card(
                          child: buildCities(city),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
