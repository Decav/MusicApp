import 'package:flutter/material.dart';

class ModificarArtistaPage extends StatefulWidget {
  ModificarArtistaPage({Key? key}) : super(key: key);

  @override
  _ModificarArtistaPageState createState() => _ModificarArtistaPageState();
}

class _ModificarArtistaPageState extends State<ModificarArtistaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar artistas'),
      ),
    );
  }
}
