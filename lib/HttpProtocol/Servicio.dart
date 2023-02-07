import 'dart:convert';

import 'package:prueba_tecnica/Common/Constant.dart';
import 'package:prueba_tecnica/Models/ResponseJobs.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class Servicio {
  ResponseJobs jobs = ResponseJobs();
  final Xml2Json xml2json = new Xml2Json();
  var path;
  var url;
  Servicio(this.path) {
    this.url = Uri.https(Constant.DOMAIN, this.path);
  }

  getJobs() async {
    http.Response response = await http.get(url);
    xml2json.parse(response.body);

    var jsonData = xml2json.toGData();
    var data = jsonDecode(jsonData);

    ResponseJobs jobs = ResponseJobs.fromJson(data);

    return jobs;
  }
}
