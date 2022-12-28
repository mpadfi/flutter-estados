import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    // print(Get.arguments['nombre']);
    final usuarioCtrl = Get.find<UsuarioController>();

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
                usuarioCtrl.cargarUsuario(Usuario(nombre: 'Manuel', edad: 41));
                Get.snackbar(
                  'Yeah!',
                  'Usuario activado',
                  backgroundColor: Colors.cyan.withOpacity(0.3),
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                    )
                  ],
                );
              },
              'Establecer Usuario',
            ),
            const SizedBox(height: 10),
            _Boton(
              () {
                usuarioCtrl.cambiarEdad(25);
              },
              'Cambiar Edad',
            ),
            const SizedBox(height: 10),
            _Boton(() {
              // usuarioCtrl.agregarProfesion('Profesión #${usuarioCtrl.usuario.value.profesiones.length}');
              usuarioCtrl.agregarProfesion('Profesión #${usuarioCtrl.profesionesCount + 1}');
            }, 'Añadir Profesión'),
            const SizedBox(height: 10),
            _Boton(() {
              Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            }, 'Cambiar Tema')
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
