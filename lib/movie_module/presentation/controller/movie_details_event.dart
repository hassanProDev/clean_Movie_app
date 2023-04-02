
abstract class MovieDetailsEvent {
  final int id;
  const MovieDetailsEvent(this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsEvent &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  GetMovieDetailsEvent(super.id);
}

class GetRecommendedMovieEvent extends MovieDetailsEvent{
  GetRecommendedMovieEvent(super.id);
}
