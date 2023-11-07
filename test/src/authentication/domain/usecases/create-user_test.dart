import 'package:course/src/authentication/domain/repositories/authentication-repository.dart';
import 'package:course/src/authentication/domain/usecases/create-user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication-reapository.mock.dart';

void main() {
  late Createuser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = Createuser(repository);
  });

  final params = CreateUserparams.empty();

  test(" ey parivash mana nihoya birinchi testni yozyapmiz ushbu project uchun",
      () async {
    // Arrange
    when(() => repository.createuser(
          createdAt: any(named: "createdAt"),
          name: any(named: "name"),
          avatar: any(named: "avatar"),
        )).thenAnswer((_) async => const Right(null));
    // Act
    final result = await usecase(params);
    //Assert
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => repository.createuser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        )).called(1);
    verifyNoMoreInteractions(repository);
  });
}
