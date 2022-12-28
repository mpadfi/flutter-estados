part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario user;
  ActivateUser(this.user);
}

class CambiarEdad extends UserEvent {
  final int edad;
  CambiarEdad(this.edad);
}

class AgregarProfesion extends UserEvent {
  final String profesion;
  AgregarProfesion(this.profesion);
}

class BorrarUsuario extends UserEvent {}
