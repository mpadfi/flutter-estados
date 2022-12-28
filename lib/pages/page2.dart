import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              () {},
              'Establecer Usuario',
            ),
            const SizedBox(height: 10),
            _Boton(
              () {},
              'Cambiar Edad',
            ),
            const SizedBox(height: 10),
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
