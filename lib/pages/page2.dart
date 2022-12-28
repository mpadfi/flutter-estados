import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página 2',
          style: TextStyle(color: Colors.black, letterSpacing: -1),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Boton(
              () {
                final newUser = Usuario(nombre: 'Manuel', edad: 41, profesiones: ['Developer']);
                userBloc.add(ActivateUser(newUser));
              },
              'Establecer Usuario',
            ),
            const SizedBox(height: 10),
            _Boton(
              () {
                userBloc.add(CambiarEdad(25));
              },
              'Cambiar Edad',
            ),
            const SizedBox(height: 10),
            _Boton(() {
              userBloc.add(AgregarProfesion('Nueva profesión'));
            }, 'Añadir Profesión'),
          ],
        ),
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  final Function()? onPress;
  final String texto;

  const _Boton(this.onPress, this.texto);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      height: 50,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: onPress,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
