import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/presentation/home/home.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';

void main() async {
  runApp(MyApp());
}

Future _initHive(BuildContext context) async {
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path.toString());
  Hive.registerAdapter(ParkingAdapter());
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
        home: FutureBuilder(
          future: _initHive(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Scaffold(
                  body: Center(child: Text(snapshot.error)),
                );
              } else {
                return HomePage();
              }
            } else {
              return Scaffold(
                body: Center(
                  child: Text(
                    "powered by FSD - FullStackDev",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
