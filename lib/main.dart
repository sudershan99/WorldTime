import 'package:flutter/material.dart';
import 'package:listdemo/pages/choose_location.dart';
import 'package:listdemo/pages/loading.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: '/home',
    routes: {

      '/': (Context) => Loading(),
      '/home': (Context) => Home(),
      '/location': (Context) => ChooseLocation(),
    },
  ));
}
