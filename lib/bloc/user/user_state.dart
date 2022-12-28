part of 'user_bloc.dart';

class UserState {
  final bool existUser;
  final Usuario? usuario;

  UserState({
    this.existUser = false,
    this.usuario,
  });
}

class UserInitialState extends UserState {
  UserInitialState() : super(existUser: false, usuario: null);
}

class UserSetState extends UserState {
  final Usuario newUser;

  UserSetState(this.newUser) : super(existUser: true, usuario: newUser);
}
