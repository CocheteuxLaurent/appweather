class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;
  double? temp;
  int? humidity;
  String? country;
  String? countryName;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
    this.temp,
    this.humidity,
    this.country,
    this.countryName,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json["id"] as int,
        main: json["weather"][0]["main"] as String,
        description: json["weather"][0]["description"] as String,
        icon: json["weather"][0]["icon"],
        temp: json["main"]["temp"],
        humidity: json["main"]["humidity"] as int,
        country: json["sys"]["country"] as String,
        countryName: json["name"] as String);
  }
}
