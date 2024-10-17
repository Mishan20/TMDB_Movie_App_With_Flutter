class Movie {
  String? posterPath;
  String? overview;
  int? id;
  String? title;
  String ? backdropPath;

  Movie({this.posterPath, this.overview, this.id, this.title, this.backdropPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      posterPath: json['poster_path'],
      overview: json['overview'],
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
    );
  }
}
