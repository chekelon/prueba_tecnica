import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/Models/Job.dart';
import 'package:prueba_tecnica/Screens/DetailsScreen.dart';
import 'package:prueba_tecnica/provider/check_internet_provider.dart';

import '../provider/JobsProvider.dart';

class JobsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Job job = Job();
    final jobs = Provider.of<JobsProvider>(context).jobs;
    final online = Provider.of<checkInternetConnectionProvider>(context).status;

    return Scaffold(
        body: jobs.source != null
            ? ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                        jobs.source!.job![index].title.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                        jobs.source!.job![index].company.toString(),
                        style: TextStyle(fontSize: 8),
                      ),
                      trailing: TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      DetailsScreen(jobs.source!.job![index])));
                        },
                        child: const Text("Ver Detalle"),
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: jobs.source!.job!.length)
            : online
                ? Center(
                    child: Image.asset(
                    'assets/no-wifi.png',
                    width: 200,
                    height: 200,
                  ))
                : Center(child: CircularProgressIndicator()));
  }
}
