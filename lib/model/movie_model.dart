class Movie {
  final String? title;
  final String? overView;
  final int? id;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;

  Movie({
    this.title,
    this.overView,
    this.id,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overView: json['overview'],
      id: json['id'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: ((json['vote_average'] as num)).toDouble(),
    );
  }
}
