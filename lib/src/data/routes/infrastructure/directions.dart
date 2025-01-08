// To parse this JSON data, do
//
//     final directions = directionsFromJson(jsonString);

import 'dart:convert';

Directions directionsFromJson(String str) =>
    Directions.fromJson(json.decode(str));

String directionsToJson(Directions data) => json.encode(data.toJson());

class Directions {
  final List<RouteDto>? routes;
  final List<Waypoint>? waypoints;
  final String? code;
  final String? uuid;

  Directions({
    this.routes,
    this.waypoints,
    this.code,
    this.uuid,
  });

  factory Directions.fromJson(Map<String, dynamic> json) => Directions(
        routes: json["routes"] == null
            ? []
            : List<RouteDto>.from(
                json["routes"]!.map((x) => RouteDto.fromJson(x))),
        waypoints: json["waypoints"] == null
            ? []
            : List<Waypoint>.from(
                json["waypoints"]!.map((x) => Waypoint.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": routes == null
            ? []
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "waypoints": waypoints == null
            ? []
            : List<dynamic>.from(waypoints!.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
      };
}

class RouteDto {
  final String? weightName;
  final double? weight;
  final double? duration;
  final double? distance;
  final List<Leg>? legs;
  final String? geometry;

  RouteDto({
    this.weightName,
    this.weight,
    this.duration,
    this.distance,
    this.legs,
    this.geometry,
  });

  factory RouteDto.fromJson(Map<String, dynamic> json) => RouteDto(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: json["legs"] == null
            ? []
            : List<Leg>.from(json["legs"]!.map((x) => Leg.fromJson(x))),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": legs == null
            ? []
            : List<dynamic>.from(legs!.map((x) => x.toJson())),
        "geometry": geometry,
      };
}

class Leg {
  final List<dynamic>? viaWaypoints;
  final List<Admin>? admins;
  final double? weight;
  final double? duration;
  final Sirns? sirns;
  final List<dynamic>? steps;
  final double? distance;
  final String? summary;

  Leg({
    this.viaWaypoints,
    this.admins,
    this.weight,
    this.duration,
    this.sirns,
    this.steps,
    this.distance,
    this.summary,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        viaWaypoints: json["via_waypoints"] == null
            ? []
            : List<dynamic>.from(json["via_waypoints"]!.map((x) => x)),
        admins: json["admins"] == null
            ? []
            : List<Admin>.from(json["admins"]!.map((x) => Admin.fromJson(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        sirns: json["sirns"] == null ? null : Sirns.fromJson(json["sirns"]),
        steps: json["steps"] == null
            ? []
            : List<dynamic>.from(json["steps"]!.map((x) => x)),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "via_waypoints": viaWaypoints == null
            ? []
            : List<dynamic>.from(viaWaypoints!.map((x) => x)),
        "admins": admins == null
            ? []
            : List<dynamic>.from(admins!.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "sirns": sirns?.toJson(),
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x)),
        "distance": distance,
        "summary": summary,
      };
}

class Admin {
  final String? iso31661Alpha3;
  final String? iso31661;

  Admin({
    this.iso31661Alpha3,
    this.iso31661,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
      };
}

class Sirns {
  Sirns();

  factory Sirns.fromJson(Map<String, dynamic> json) => Sirns();

  Map<String, dynamic> toJson() => {};
}

class Waypoint {
  final double? distance;
  final String? name;
  final List<double>? location;

  Waypoint({
    this.distance,
    this.name,
    this.location,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: json["location"] == null
            ? []
            : List<double>.from(json["location"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location":
            location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
      };
}
