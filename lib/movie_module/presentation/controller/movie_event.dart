abstract class MovieEvent{
  const MovieEvent();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieEvent && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class GetNowPlayingEvent extends MovieEvent{}
class GetPopularEvent extends MovieEvent{}
class GetTopRatedEvent extends MovieEvent{}