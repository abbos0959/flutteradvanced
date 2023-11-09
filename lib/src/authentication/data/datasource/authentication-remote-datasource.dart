import "dart:convert";

import "package:course/core/errors/excaption.dart";
import 'package:course/src/authentication/data/models/user-model.dart';
import "package:http/http.dart" as http;
import "package:course/core/utils/constants.dart";

abstract class AuthenticationremoteDataSourse {
  // const AuthRemoteDataSourseImpl(this._client);
  Future<void> createuser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  Future<List<UserModel>> getuser();
}

const kCreateBaseUrl = "/users";
const kGetBaserUrl = "/user";

class AuthRemoteDataSourseImpl implements AuthenticationremoteDataSourse {
  AuthRemoteDataSourseImpl(this._client);

  final http.Client _client;

  @override
  Future<void> createuser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    try {
      final response = await _client.post(
        Uri.parse("$kbaseurl$kCreateBaseUrl"),
        body: jsonEncode(
          {"avatar": "avatar", "name": "name", "createdAt": "createdAt"},
        ),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw (const ServerEcxeption(
            message: "emailda nimadir xato ketdi ", statusCode: 400));
      }
    } on ServerEcxeption {
      rethrow;
    } catch (e) {
      throw ServerEcxeption(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<List<UserModel>> getuser() {
    throw UnimplementedError();
  }
}
