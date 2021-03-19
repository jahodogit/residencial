import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/presentation/home/home.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';

void main() {
  var path = Directory.current.path;
  Hive.init(path);
  Hive.registerAdapter(ParkingAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ParkingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parking',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: HomePage(),
      ),
    );
  }
}
