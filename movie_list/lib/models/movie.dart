import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
    String model;
    int pk;
    Fields fields;

    Movie({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String movieName;
    DateTime releaseDate;
    int rating;
    String description;
    int likes;

    Fields({
        required this.user,
        required this.movieName,
        required this.releaseDate,
        required this.rating,
        required this.description,
        required this.likes,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        movieName: json["movie_name"],
        releaseDate: DateTime.parse(json["release_date"]),
        rating: json["rating"],
        description: json["description"],
        likes: json["likes"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "movie_name": movieName,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "rating": rating,
        "description": description,
        "likes": likes,
    };
}
