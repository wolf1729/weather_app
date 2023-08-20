import 'package:flutter/material.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/screens/introanime.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' :(context) => introanime(),
      '/home1' :(context) => homepage()
    },
  ));
}
