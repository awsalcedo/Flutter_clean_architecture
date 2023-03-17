import 'package:equatable/equatable.dart';

/*abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object?> get props => [message];
}

// Failures generales de la app
class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message: message);
}

class CacheFailure extends Failure {
  const CacheFailure({required String message}) : super(message: message);
}

class SocketFailure extends Failure {
  const SocketFailure({required String message}) : super(message: message);
}*/

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class CacheFailure extends Failure {}
