import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          usuarioService.existeUsuario ? usuarioService.usuario!.nombre : 'Página 2',
          style: const TextStyle(color: Colors.black, letterSpacing: -1),
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
                usuarioService.usuario = Usuario(
                  nombre: 'Manuel',
                  edad: 0,
                  profesiones: ['Designer', 'FrontEnd Developer', 'Apps Developer'],
                );
                // Navigator.of(context).pop();
              },
              'Establecer Usuario',
            ),
            const SizedBox(height: 10),
            _Boton(
              () {
                usuarioService.cambiarEdad(41);
              },
              'Cambiar Edad',
            ),
            const SizedBox(height: 10),
            _Boton(() {
              usuarioService.agregarProfesion();
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
