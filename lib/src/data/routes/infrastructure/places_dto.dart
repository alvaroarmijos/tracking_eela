// To parse this JSON data, do
//
//     final placesDto = placesDtoFromJson(jsonString);

import 'dart:convert';

PlacesDto placesDtoFromJson(String str) => PlacesDto.fromJson(json.decode(str));

String placesDtoToJson(PlacesDto data) => json.encode(data.toJson());

class PlacesDto {
  final String? type;
  final List<String>? query;
  final List<Feature>? features;
  final String? attribution;

  PlacesDto({
    this.type,
    this.query,
    this.features,
    this.attribution,
  });

  factory PlacesDto.fromJson(Map<String, dynamic> json) => PlacesDto(
        type: json["type"],
        query: json["query"] == null
            ? []
            : List<String>.from(json["query"]!.map((x) => x)),
        features: json["features"] == null
            ? []
            : List<Feature>.from(
                json["features"]!.map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x)),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "attribution": attribution,
      };
}

class Feature {
  final String? text;
  final String? placeName;
  final List<double>? center;

  Feature({
    this.text,
    this.placeName,
    this.center,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        text: json["text"],
        placeName: json["place_name"],
        center: json["center"] == null
            ? []
            : List<double>.from(json["center"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "place_name": placeName,
        "center":
            center == null ? [] : List<dynamic>.from(center!.map((x) => x)),
      };
}
