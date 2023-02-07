import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:provider/provider.dart';
import 'package:prueba_tecnica/provider/JobsProvider.dart';

import 'package:prueba_tecnica/provider/check_internet_provider.dart';
import 'package:prueba_tecnica/provider/navigation_select_provider.dart';

import 'Screens/MainScreen.dart';
import 'Screens/JobsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => tapNavigatorBar()),
        ChangeNotifierProvider(
            create: (_) => checkInternetConnectionProvider()),
        ChangeNotifierProvider(create: (_) => JobsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba Tecnica',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {'home': (_) => MainScreen(), 'vacantes': (_) => JobsScreen()},
        builder: EasyLoading.init(),
      ),
    );
  }
}
