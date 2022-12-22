import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.black,
            ),
            onPressed: () => usuarioService.borrarUsuario(),
          )
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario!)
          : const Center(
              child: Text('No hay datos de usuario'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  //
  final Usuario usuario;

  const InformacionUsuario(this.usuario, {super.key});

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
            ...usuario.profesiones!.map((e) => ListTile(title: Text(e))).toList()
            // const ListTile(title: Text('Profesion 1: ')),
          ],
        ));
  }
}
