import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/controllers/usuario_controller.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: NetworkImage('https://res.cloudinary.com/strapi/image/upload/v1621261454/logo_vgoldp.png'),
              height: 40,
            ),
            Text('GetX',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                )),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
      ),
      body: Obx(
        () => usuarioCtrl.existeUsuario.value
            ? InformacionUsuario(
                usuario: usuarioCtrl.usuario.value,
              )
            : const NoInfo(),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushNamed(context, 'page2'),
        onPressed: () => Get.toNamed('page2', arguments: {
          'nombre': 'Manuel',
          'edad': 41,
        }),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
      child: Text('No hay usuario seleccionado'),
    ));
  }
}

class InformacionUsuario extends StatelessWidget {
  //
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(title: Text('Nombre: ${usuario.nombre}')),
            ListTile(title: Text('Edad: ${usuario.edad}')),
            const SizedBox(
              height: 20,
            ),
            const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),

            // usamos spread porque estamos dentro de un arreglo
            ...usuario.profesiones.map((e) => ListTile(title: Text(e))).toList()
          ],
        ));
  }
}
