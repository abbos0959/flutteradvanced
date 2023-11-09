import 'dart:convert';
import 'dart:html';

import 'package:course/core/errors/excaption.dart';
import 'package:course/core/utils/constants.dart';
import 'package:course/src/authentication/data/datasource/authentication-remote-datasource.dart';
import 'package:course/src/authentication/data/models/user-model.dart';
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
          Uri.https(kbaseurl, kCreateBaseUrl),
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
          Uri.https(kbaseurl, kCreateBaseUrl),
          body: jsonEncode(
            {"avatar": "avatar", "name": "name", "createdAt": "createdAt"},
          ),
        ),
      );
      verifyNoMoreInteractions(client);
    });
  });

  group("get userlar", () {
    const tusers = [UserModel.empty()];
    test(
      "get user uchun test",
      () async => {
        when(() => client.get(any())).thenAnswer((_) async =>
            http.Response(jsonEncode([tusers.first.toMap()]), 200)),
        expect(await remoteDataSourse.getuser(), equals(tusers)),
        verify(
          () => client.post(Uri.http(kbaseurl, kCreateBaseUrl)),
        ).called(1),
        verifyNoMoreInteractions(client)
      },
    );

    test(
        "user topilmadi uchun test",
        () async => {
              when(() => client.get(any())).thenAnswer((_) async =>
                  http.Response("voy ukajon nimadir xato ketdida endi ", 500)),
              expect(
                  remoteDataSourse.getuser(),
                  throwsA(const ServerEcxeption(
                      message:
                          "ko'zinga qarab tersang bo'lmadydimi emailni  mana  oqibatda xato qilding",
                      statusCode: 500))),
              verify(() => client.get(Uri.http(kbaseurl, kGetBaserUrl)))
                  .called(1),
              verifyNoMoreInteractions(client)
            });
  });
}
