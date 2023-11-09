import 'dart:convert';
import 'dart:html';

import 'package:course/core/errors/excaption.dart';
import 'package:course/core/utils/constants.dart';
import 'package:course/src/authentication/data/datasource/authentication-remote-datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;

  late AuthenticationremoteDataSourse remoteDataSourse;
  setUp(() => {
        client = MockClient(),
        remoteDataSourse = AuthRemoteDataSourseImpl(client)
      });
  registerFallbackValue(Uri());
  group("user yaratish", () async {
    test("user yaratish testo", () async {
      when(() => client.post(any(), body: any(named: "body")))
          .thenAnswer((_) async => http.Response("user yaratildi", 201));

      final result = remoteDataSourse.createuser;

      expect(result(avatar: "avatar", name: "name", createdAt: "createdAt"),
          (completes));
      verify(
        () => client.post(
          Uri.parse("$kbaseurl$kCreateBaseUrl"),
          body: jsonEncode(
            {"avatar": "avatar", "name": "name", "createdAt": "createdAt"},
          ),
        ),
      );
      verifyNoMoreInteractions(client);
    });

    test("api uchun testo", () async {
      when(() => client.post(any(), body: any(named: "body")))
          .thenAnswer((_) async => http.Response("email xatoligi", 400));

      final methodCall = remoteDataSourse.createuser;

      expect(
          () async => methodCall,
          throwsA(const ServerEcxeption(
              message: "email xatoligi", statusCode: 400)));
      verify(
        () => client.post(
          Uri.parse("$kbaseurl$kCreateBaseUrl"),
          body: jsonEncode(
            {"avatar": "avatar", "name": "name", "createdAt": "createdAt"},
          ),
        ),
      );
      verifyNoMoreInteractions(client);
    });
  });
}
