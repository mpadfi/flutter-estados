import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    //
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.user));
    });

    on<CambiarEdad>((event, emit) {
      if (!state.existUser) return;
      // emitir nuevo estado
      emit(UserSetState(state.usuario!.copyWith(edad: event.edad)));
    });

    on<AgregarProfesion>((event, emit) {
      if (!state.existUser) return;
      final professions = [...state.usuario!.profesiones, event.profesion];
      emit(UserSetState(state.usuario!.copyWith(profesiones: professions)));
    });

    on<BorrarUsuario>((event, emit) {
      emit(UserInitialState());
    });
  }
}
