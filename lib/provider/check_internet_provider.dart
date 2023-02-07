import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class checkInternetConnectionProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool _status = false;

  checkInternetConnectionProvider() {
    _checkInternetConnection();
    _connectivity.onConnectivityChanged.listen((_) {
      _checkInternetConnection();
    });
  }

  bool get status => _status;
  set status(bool value) {
    _status = value;
    notifyListeners();
  }

  Future<void> _checkInternetConnection() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        status = false;
      } else {
        status = true;
      }
    } catch (e) {
      status = true;
    }
  }
}
