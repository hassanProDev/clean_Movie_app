class Movie {
  final String backdrop_path;
  final int id;
  final num vote_average;
  final String title;
  final String overview;
  final String release_date;
  final List<int> genre_ids;

  const Movie({
    required this.backdrop_path,
    required this.id,
    required this.title,
    required this.genre_ids,
    required this.overview,
    required this.release_date,
    required this.vote_average,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          backdrop_path == other.backdrop_path &&
          id == other.id &&
          vote_average == other.vote_average &&
          title == other.title &&
          overview == other.overview &&
          release_date == other.release_date &&
          genre_ids == other.genre_ids;

  @override
  int get hashCode =>
      backdrop_path.hashCode ^
      id.hashCode ^
      vote_average.hashCode ^
      title.hashCode ^
      overview.hashCode ^
      release_date.hashCode ^
      genre_ids.hashCode;
}
