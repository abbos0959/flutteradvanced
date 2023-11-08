import 'package:equatable/equatable.dart';

class ServerEcxeption implements Equatable {
  const ServerEcxeption({required this.message, required this.statusCode});

  final String message;
  final String statusCode;

  @override
  List<Object?> get props => [message, statusCode];

  @override
  bool? get stringify => throw UnimplementedError();
}
