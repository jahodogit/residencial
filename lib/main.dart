import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/presentation/home/home.dart';

import 'package:residencial/presentation/login/login.dart';
import 'package:residencial/presentation/providers/auth_provider.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/routes.dart';
import 'package:residencial/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future _initHive(BuildContext context) async {
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path.toString());
  Hive.registerAdapter(ParkingAdapter());
  Hive.registerAdapter(VisitaAdapter());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ParkingProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()..init())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        title: 'Parking',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: FutureBuilder(
          future: _initHive(context),
          builder: (context, snapshot) {
            AuthProvider authProvider = Provider.of<AuthProvider>(context);
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Scaffold(
                  body: Center(child: Text(snapshot.error)),
                );
              } else {
                return authProvider.isLogedIn ? HomePage() : LoginPage();
              }
            } else {
              return SplashPage();
            }
          },
        ),
        routes: buildAppRoutes(),
      ),
    );
  }
}
