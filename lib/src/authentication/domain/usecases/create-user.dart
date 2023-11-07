import 'package:course/core/usecases/usecase.dart';
import 'package:course/core/utils/typedef.dart';
import 'package:course/src/authentication/domain/repositories/authentication-repository.dart';
import 'package:equatable/equatable.dart';

class Createuser extends UsecaseWithParams<void, CreateUserparams> {
  const Createuser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserparams params) async => _repository.createuser(
      name: params.name, avatar: params.avatar, createdAt: params.createdAt);
}

class CreateUserparams extends Equatable {
  const CreateUserparams(
      {required this.createdAt, required this.name, required this.avatar});

  const CreateUserparams.empty()
      : this(
            createdAt: "bo'sh createdat",
            name: "bo'sh name",
            avatar: "bo'sh avatar");

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
