import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_weather_app/screens/main_screen.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Weather Info',
        debugShowCheckedModeBanner: false,

        home: MainScreen(),
        );
  }
}

