
abstract class Failure{
  final String message;

  const Failure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class ServerFailure extends Failure{
  ServerFailure(super.message);
}

class DatabaseFailure extends Failure{
  DatabaseFailure(super.message);
}

