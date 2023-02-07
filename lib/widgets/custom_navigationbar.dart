import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/HttpProtocol/Servicio.dart';
import 'package:prueba_tecnica/provider/JobsProvider.dart';

import '../provider/check_internet_provider.dart';
import '../provider/navigation_select_provider.dart';

class CustomNavigationbar extends StatelessWidget {
  const CustomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    final indexSelected = Provider.of<tapNavigatorBar>(context);
    final jobsProvider = Provider.of<JobsProvider>(context);
    final online = Provider.of<checkInternetConnectionProvider>(context).status;
    final servicio = Servicio("/xml-feed/indeed");
    final currentIndex = indexSelected.selectedMenuOpt;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 5,
      selectedItemColor: Colors.deepPurple,
      onTap: ((value) async {
        indexSelected.selectedMenuOpt = value;
        if (value == 1 && online == false) {
          jobsProvider.jobs = await servicio.getJobs();
        }
        print("Menu seleccionado: $value");
      }),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Vacantes')
      ],
    );
  }
}
