import 'dart:convert';

import 'package:course/core/utils/typedef.dart';
import 'package:course/src/authentication/data/models/user-model.dart';
import 'package:course/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture-rider.dart';

void main() {
  const tModel = UserModel.empty();
  test("bu usermodel uchun test", () async {
    expect(tModel, isA<User>());
  });

  final tJson = fixture("user.json");
  final tMap = jsonDecode(tJson) as DataMap;

  group("fromMap uchun", () {
    test("fromMap ichidagi test", () {
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));

      // final result = UserModel.fromMap(tJson);
    });
  });
}
