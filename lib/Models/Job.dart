class Job {
  Job({
    this.title,
    this.date,
    this.referencenumbre,
    this.url,
    this.company,
    this.city,
    this.state,
    this.country,
    this.description,
    this.indeedApplyData,
  });

  String? title;
  String? date;
  String? referencenumbre;
  String? url;
  String? company;
  String? city;
  String? state;
  String? country;
  String? description;
  String? indeedApplyData;

  factory Job.fromJson(Map<String, dynamic> json) {
    var descripcion = json["description"]["__cdata"];

    return Job(
      title: json["title"] == null ? null : json["title"]["__cdata"],
      date: json["date"] == null ? null : json["date"]["__cdata"],
      referencenumbre: json["referencenumbre"] == null
          ? ""
          : json["referencenumbre"]["__cdata"],
      url: json["url"] == null ? null : json["url"]["__cdata"],
      company: json["company"] == null ? null : json["company"]["__cdata"],
      city: json["city"] == null ? null : json["city"]["__cdata"],
      state: json["state"] == null ? null : json["state"]["__cdata"],
      country: json["country"] == null ? null : json["country"]["__cdata"],
      description: json["description"] == null ? null : descripcion,
      indeedApplyData: json["indeed-apply-data"] == null
          ? null
          : json["indeed-apply-data"]["__cdata"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "referencenumbre": referencenumbre,
        "url": url,
        "company": company,
        "city": city,
        "state": state,
        "country": country,
        "description": description,
        "indeed-apply-data": indeedApplyData,
      };
}
