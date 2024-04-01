import 'dart:convert';

Favorite favoriteFromJson(String str) => Favorite.fromJson(json.decode(str));

String favoriteToJson(Favorite data) => json.encode(data.toJson());

class Favorite {
  final String city;
  final String country;
  final String humidity;
  final String speed;
  final String temp;
  final String icon;


  Favorite({
    required this.city,
    required this.country,
    required this.humidity,
    required this.speed,
    required this.temp,
    required this.icon,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    city: json["city"],
    country: json["country"],
    humidity: json["humidity"],
    speed: json["speed"],
    temp: json["temp"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "humidity": humidity,
    "speed": speed,
    "temp": temp,
    "icon": icon,
  };
}
