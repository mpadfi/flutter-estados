import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return (snapshot.hasData)
                ? Text(snapshot.data!.nombre)
                : usuarioService.existeUsuario
                    ? Text(usuarioService.usuario!.nombre)
                    : const Text('Página 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Boton(
              () {
                final nuevoUsuario = Usuario(nombre: 'Manuel', edad: 20);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              'Establecer Usuario',
            ),
            _Boton(() {
              usuarioService.cambiarEdad(41);
            }, 'Cambiar Edad'),
            _Boton(() {}, 'Añadir Profesión'),
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
      color: Colors.cyan,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: onPress,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
