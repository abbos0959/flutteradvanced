import 'package:course/core/errors/excaption.dart';
import 'package:course/core/errors/failure.dart';
import 'package:course/core/utils/typedef.dart';
import 'package:course/src/authentication/data/datasource/authentication-remote-datasource.dart';
import 'package:course/src/authentication/domain/entities/user.dart';
import 'package:course/src/authentication/domain/repositories/authentication-repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDatasource);

  final AuthenticationremoteDataSourse _remoteDatasource;

  @override
  ResultVoid createuser(
      {required String name,
      required String avatar,
      required String createdAt}) async {
    try {
      await _remoteDatasource.createuser(
          createdAt: createdAt, name: name, avatar: avatar);
      return Right(null);
    } on ServerEcxeption catch (e) {
      return Left(ApiFailure.fromExcaption(e));
    }
  }

  @override
  Resultfuture<List<User>> getuser() async {
    try {
      final result = await _remoteDatasource.getuser();

      return Right(result);
    } on ServerEcxeption catch (e) {
      return Left(ApiFailure.fromExcaption(e));
    }
  }
}
