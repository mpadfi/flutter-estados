import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Image(
              width: 100,
              image: NetworkImage('https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png'),
            ),
            Text('Estados',
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.black,
            ),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false).add(BorrarUsuario());
            },
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
              ? InformacionUsuario(usuario: state.usuario!)
              : const Center(
                  child: Text('No hay usuario'),
                );
        },
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
            const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const Divider(),
            ListTile(title: Text('Nombre: ${usuario.nombre}')),
            ListTile(title: Text('Edad: ${usuario.edad}')),
            const SizedBox(
              height: 20,
            ),
            const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const Divider(),
            ...usuario.profesiones.map((prof) => ListTile(title: Text(prof))).toList()
          ],
        ));
  }
}
