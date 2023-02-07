import 'package:prueba_tecnica/Models/Job.dart';

class Source {
  Source({
    this.publisher,
    this.publisherurl,
    this.job,
  });

  String? publisher;
  String? publisherurl;
  List<Job>? job;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        publisher:
            json["publisher"] == null ? null : json["publisher"]["\u0024t"],
        publisherurl: json["publisherurl"] == null
            ? null
            : json["publisherurl"]["\u0024t"],
        job: json["job"] == null
            ? []
            : List<Job>.from(json["job"]!.map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "publisher": publisher,
        "publisherurl": publisherurl,
        "job":
            job == null ? [] : List<dynamic>.from(job!.map((x) => x.toJson())),
      };
}
