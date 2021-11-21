import 'package:flutter/material.dart';

class ModificarCancionPage extends StatefulWidget {
  ModificarCancionPage({Key? key}) : super(key: key);

  @override
  _ModificarCancionPageState createState() => _ModificarCancionPageState();
}

class _ModificarCancionPageState extends State<ModificarCancionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Cancion'),
      ),
    );
  }
}
