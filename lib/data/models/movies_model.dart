import 'dart:convert';

List<MoviesModel> moviesModelFromJson(String str) => List<MoviesModel>.from(json.decode(str).map((x) => MoviesModel.fromJson(x)));

String moviesModelToJson(List<MoviesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesModel {
    int? id;
    String? url;
    String? title;
    String? year;
    List<String>? genre;
    String? sinopsis;

    MoviesModel({
        this.id,
        this.url,
        this.title,
        this.year,
        this.genre,
        this.sinopsis,
    });

    factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        year: json["year"],
        genre: json["genre"] == null ? [] : List<String>.from(json["genre"]!.map((x) => x)),
        sinopsis: json["sinopsis"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "year": year,
        "genre": genre == null ? [] : List<dynamic>.from(genre!.map((x) => x)),
        "sinopsis": sinopsis,
    };
}
