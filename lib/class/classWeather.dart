class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["id"] as int,
      main: json["weather"][0]["main"] as String,
      description: json["weather"][0]["description"] as String,
      icon: json["weather"][0]["icon"] as String,
    );
  }
}
