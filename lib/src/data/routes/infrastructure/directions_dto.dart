// To parse this JSON data, do
//
//     final directions = directionsFromJson(jsonString);

import 'dart:convert';

Directions directionsFromJson(String str) =>
    Directions.fromJson(json.decode(str));

String directionsToJson(Directions data) => json.encode(data.toJson());

class Directions {
  final List<RouteDto>? routes;
  final String? code;
  final String? uuid;

  Directions({
    this.routes,
    this.code,
    this.uuid,
  });

  factory Directions.fromJson(Map<String, dynamic> json) => Directions(
        routes: json["routes"] == null
            ? []
            : List<RouteDto>.from(
                json["routes"]!.map((x) => RouteDto.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": routes == null
            ? []
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
      };
}

class RouteDto {
  final String? weightName;
  final double? weight;
  final double? duration;
  final double? distance;
  final String? geometry;

  RouteDto({
    this.weightName,
    this.weight,
    this.duration,
    this.distance,
    this.geometry,
  });

  factory RouteDto.fromJson(Map<String, dynamic> json) => RouteDto(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "geometry": geometry,
      };
}
