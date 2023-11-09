part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CreatUserEvent extends AuthenticationEvent {
  const CreatUserEvent(
      {required this.createdAt, required this.name, required this.avatar});

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object> get props => [avatar, name, createdAt];
} 

class GetUserEvent extends AuthenticationEvent{
  const  GetUserEvent(); 
}
