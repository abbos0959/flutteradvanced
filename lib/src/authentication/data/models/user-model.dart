import 'dart:convert';

import 'package:course/core/utils/typedef.dart';
import 'package:course/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.avatar,
      required super.createdAt,
      required super.id,
      required super.name});

  const UserModel.empty()
      : this(
          id: "1",
          avatar: "bosh avatar",
          name: "bosh name",
          createdAt: "bosh created at",
        );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
            id: map["id"] as String,
            avatar: map["avatar"] as String,
            name: map["name"] as String,
            createdAt: map["created"] as String);

  UserModel copyWith({
    String? id,
    String? name,
    String? createdAt,
    String? avatar,
  }) {
    return UserModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        avatar: this.avatar);
  }

  DataMap toMap() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "createdAt": createdAt,
      };

  String toJson() => jsonEncode(toMap());
}
