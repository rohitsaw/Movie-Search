import 'dart:core';

class Album {
  String title;
  String language;
  String rated;
  String releasedDate;
  String runTime;
  String director;
  String plot;
  String production;

  String writers;
  String casts;
  String genre;

  Map<String, String> ratings;
  String imdbId;

  Album({
    this.title,
    this.language,
    this.rated,
    this.releasedDate,
    this.runTime,
    this.director,
    this.plot,
    this.production,
    this.writers,
    this.casts,
    this.genre,
    this.ratings,
    this.imdbId,
  });

  static Map<String, String> makeDict(
      List<dynamic> jsonRatings, String imdbRating) {
    Map<String, String> mp = {};
    for (var each in jsonRatings) {
      if (each['Source'] == 'Internet Movie Database') continue;
      mp[each['Source']] = each['Value'];
    }
    mp["imdbRating"] = imdbRating;
    return mp;
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['Title'] ?? "N/A",
      language: json['Language'] ?? "N/A",
      rated: json['Rated'] ?? "",
      releasedDate: json['Released'] ?? "N/A",
      runTime: json['Runtime'] ?? "N/A",
      director: json['Director'] ?? "N/A",
      plot: json["Plot"] ?? "N/A",
      production: json['Production'] ?? "N/A",
      writers: json['Writer'] ?? "N/A",
      casts: json['Actors'] ?? "N/A",
      genre: json['Genre'] ?? "N/A",
      imdbId: json['imdbID'],
      ratings: makeDict(json['Ratings'], json['imdbRating']),
    );
  }
}
