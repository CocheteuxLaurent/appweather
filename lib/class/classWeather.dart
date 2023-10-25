class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;
  double? temp;
  int? humidity;
  String? country;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
    this.temp,
    this.humidity,
    this.country,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["id"] as int,
      main: json["weather"][0]["main"] as String,
      description: json["weather"][0]["description"] as String,
      icon: json["weather"][0]["icon"],
      temp: json["main"]["temp"] as double,
      humidity: json["main"]["humidity"] as int,
      country: json["sys"]["country"] as String,
    );
  }
}
