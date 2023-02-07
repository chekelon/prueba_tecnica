import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/Screens/JobsScreen.dart';

import '../provider/navigation_select_provider.dart';
import '../widgets/custom_navigationbar.dart';
import 'HomeScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationbar(),
    ));
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final indexSelected = Provider.of<tapNavigatorBar>(context);

    //print("User:  ${indexSelected.selectedMenuOpt}");

    final currentIndex = indexSelected.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return JobsScreen();
      default:
        return HomeScreen();
    }
  }
}
