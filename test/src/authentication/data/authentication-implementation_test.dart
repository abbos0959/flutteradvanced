import 'dart:js_util';

import 'package:course/core/errors/excaption.dart';
import 'package:course/core/errors/failure.dart';
import 'package:course/src/authentication/data/authentication-implementation.dart';
import 'package:course/src/authentication/data/datasource/authentication-remote-datasource.dart';
import 'package:course/src/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthenticationremoteDataSourse {}

void main() {
  late AuthenticationremoteDataSourse remoteDataSource;
  late AuthenticationRepositoryImplementation repoimpl;
  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repoimpl = AuthenticationRepositoryImplementation(remoteDataSource);
  });

  const tExceaption = ServerEcxeption(
      message: "nimadir xato ketdida gulbadan", statusCode: 500);
  group("user yaratish", () {
    const name = "name";
    const createdAt = "createdAt";
    const avatar = "avatar";
    test("user yaratish ichidagi test", () async {
      when(() => remoteDataSource.createuser(
          createdAt: any(named: "createdAt"),
          name: any(named: "name"),
          avatar: any(named: "avatar"))).thenAnswer((_) => Future.value());

      final result = await repoimpl.createuser(
          name: name, avatar: avatar, createdAt: createdAt);

      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.createuser(
          createdAt: createdAt, name: name, avatar: avatar)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
    test("remote source uchun  test", () async {
      when(() => remoteDataSource.createuser(
          createdAt: any(named: "createdAt"),
          name: any(named: "name"),
          avatar: any(named: "avatar"))).thenThrow(tExceaption);

      final result = await repoimpl.createuser(
          name: name, avatar: avatar, createdAt: createdAt);

      expect(
          result,
          equals(
            Left(
              ApiFailure(
                  message: tExceaption.message,
                  statusCode: tExceaption.statusCode),
            ),
          ));
      verify(() => remoteDataSource.createuser(
          createdAt: createdAt, name: name, avatar: avatar)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group("ikkinchi marta group ochsishim auth implement uchun", () {
    test("getuseruchun test", () async {
      when(() => remoteDataSource.getuser()).thenAnswer(
        (_) async => isA<Right<dynamic, List<User>>>(),
      );

      final result = await repoimpl.getuser();
      expect(result, equals(const Right([])));
      verify(() => remoteDataSource.getuser()).called(1);

      verifyNoMoreInteractions(remoteDataSource);
    });

    test("ikkinchi davay", () async {
      when(() => remoteDataSource.getuser()).thenThrow(tExceaption);

      final result = await repoimpl.getuser();

      expect(result, equals(Left(ApiFailure.fromExcaption(tExceaption))));

      verify(() => remoteDataSource.getuser()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
