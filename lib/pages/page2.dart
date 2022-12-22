import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Boton(() {}, 'Establecer Usuario'),
            _Boton(() {}, 'Cambiar Edad'),
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
