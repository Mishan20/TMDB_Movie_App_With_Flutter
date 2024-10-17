class Movie {
  String? posterPath;
  String? overview;
  int? id;
  String? title;
  String ? backdropPath;
  double? voteAverage;
  int? voteCount;

  Movie({this.posterPath, this.overview, this.id, this.title, this.backdropPath, this.voteAverage, this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      posterPath: json['poster_path'],
      overview: json['overview'],
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
