import 'package:course/src/authentication/data/models/user-model.dart';

abstract class AuthenticationremoteDataSourse {
  Future<void> createuser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  Future<List<UserModel>> getuser();
}
