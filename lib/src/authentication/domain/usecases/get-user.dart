import 'package:course/core/usecases/usecase.dart';
import 'package:course/core/utils/typedef.dart';
import 'package:course/src/authentication/domain/entities/user.dart';
import 'package:course/src/authentication/domain/repositories/authentication-repository.dart';

class Getuser extends UsecaseWithoutParams<List<User>> {
  const Getuser(this._repository);

  final AuthenticationRepository _repository;

  @override
  Resultfuture<List<User>> call() async => _repository.getuser();
}
