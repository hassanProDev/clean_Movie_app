class RecommendedMovie {
  final int id;
  final String poster_path;

  const RecommendedMovie({
    required this.id,
    required this.poster_path,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecommendedMovie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          poster_path == other.poster_path;

  @override
  int get hashCode => id.hashCode ^ poster_path.hashCode;
}
