class MovieDetails {
  final String? poster_path;
  final String original_title;
  final String overview;
  final String release_date;
  final List<Genres> genres;
  final int id;
  final int runtime;
  final num vote_average;

  const MovieDetails({
    required this.release_date,
    this.poster_path,
    required this.original_title,
    required this.overview,
    required this.genres,
    required this.id,
    required this.runtime,
    required this.vote_average,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetails &&
          runtimeType == other.runtimeType &&
          poster_path == other.poster_path &&
          release_date == other.release_date &&
          original_title == other.original_title &&
          overview == other.overview &&
          genres == other.genres &&
          id == other.id &&
          runtime == other.runtime &&
          vote_average == other.vote_average;

  @override
  int get hashCode =>
      poster_path.hashCode ^
      original_title.hashCode ^
      overview.hashCode ^
      genres.hashCode ^
      release_date.hashCode ^
      id.hashCode ^
      runtime.hashCode ^
      vote_average.hashCode;
}

class Genres {
  final int id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genres &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
