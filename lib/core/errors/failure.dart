import 'package:course/core/errors/excaption.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message, required super.statusCode});

  ApiFailure.fromExcaption(ServerEcxeption ecxeption)
      : this(message: ecxeption.message, statusCode: ecxeption.statusCode);
}
