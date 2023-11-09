import 'package:bloc/bloc.dart';
import 'package:course/src/authentication/domain/entities/user.dart';
import 'package:course/src/authentication/domain/usecases/create-user.dart';
import 'package:course/src/authentication/domain/usecases/get-user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required Createuser createuser, required Getuser getuser})
      : _createUser = createuser,
        _getUsers = getuser,
        super(const AuthenticationInitial()) {
    on<CreatUserEvent>(_creatUserhandler);
    on<GetUserEvent>(_getUserHandler);
  }

  final Createuser _createUser;
  final Getuser _getUsers;

  Future<void> _creatUserhandler(
    CreatUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const CreatingUser());
    final result = await _createUser(CreateUserparams(
        createdAt: event.createdAt, name: event.name, avatar: event.avatar));

    result.fold(
        (l) => emit(AuthenticationError("${l.statusCode} xato ${l.message}")),
        (_) => emit(const UserCreated()));
  }

  Future<void> _getUserHandler(
    GetUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(GettingUser());
  }
}
