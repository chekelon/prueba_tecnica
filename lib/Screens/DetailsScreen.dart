import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/Job.dart';

class DetailsScreen extends StatelessWidget {
  Job job;
  DetailsScreen(this.job);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final description = job.description!.replaceAll("\\\\n", "\n");
    final result = description.replaceAll("●", "\n●");

    final fecha = DateTime.parse(job.date.toString());
    final mes = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre"
    ];

    String fechaPublicacion = " ${fecha.day} ${mes[fecha.month]} ${fecha.year}";
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalle de la Vacante'),
        ),
        body: Card(
          child: SingleChildScrollView(
            child: Container(
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    job.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        job.company!,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        fechaPublicacion,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "${job.city},${job.state} ${job.country}",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    child: Text(result),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
