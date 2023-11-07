import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.avatar});

  const User.empty()
      : this(
          id: "1",
          avatar: "bosh avatar",
          name: "bosh name",
          createdAt: "bosh created at",
        );

  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [id];
}
