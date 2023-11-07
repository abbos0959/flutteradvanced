import 'package:course/src/authentication/domain/entities/user.dart';
import 'package:course/src/authentication/domain/repositories/authentication-repository.dart';
import 'package:course/src/authentication/domain/usecases/get-user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'authentication-reapository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late Getuser usercase;

  setUp(() {
    repository = MockAuthRepo();

    usercase = Getuser(repository);
  });

  const tResponse = [User.empty()];
  test("ey parivash bu getuser uchun test", () async {
    when(() => repository.getuser())
        .thenAnswer((_) async => const Right(tResponse));
  });
}
