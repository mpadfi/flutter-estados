import 'package:flutter/material.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit',
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
      ),
      body: const InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ListTile(title: Text('Nombre: ')),
            ListTile(title: Text('Edad: ')),
            SizedBox(
              height: 20,
            ),
            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ListTile(title: Text('Profesion 1: ')),
            ListTile(title: Text('Profesion 2: ')),
            ListTile(title: Text('Profesion 3: ')),
          ],
        ));
  }
}
