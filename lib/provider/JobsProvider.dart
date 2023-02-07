import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Models/ResponseJobs.dart';

class JobsProvider extends ChangeNotifier {
  ResponseJobs _jobs = ResponseJobs();

  ResponseJobs get jobs => _jobs;

  set jobs(ResponseJobs value) {
    _jobs = value;
    notifyListeners();
  }
}
