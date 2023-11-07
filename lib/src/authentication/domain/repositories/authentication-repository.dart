import 'package:course/core/utils/typedef.dart';
import 'package:course/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createuser(
      {required String name,
      required String avatar,
      required String createdAt});

  Resultfuture<List<User>> getuser();
}
