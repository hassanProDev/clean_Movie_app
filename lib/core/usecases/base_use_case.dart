import 'package:clean_movie_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T,Parameters>{
  Future<Either<Failure,T>> call(Parameters parameters);
}

class NoParameters{

  const NoParameters();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoParameters && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}