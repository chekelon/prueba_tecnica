import 'dart:convert';

import 'package:prueba_tecnica/Models/Source.dart';

ResponseJobs responseJobsFromJson(String str) =>
    ResponseJobs.fromJson(json.decode(str));

String responseJobsToJson(ResponseJobs data) => json.encode(data.toJson());

class ResponseJobs {
  ResponseJobs({
    this.source,
  });

  Source? source;

  factory ResponseJobs.fromJson(Map<String, dynamic> json) => ResponseJobs(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
      };
}
