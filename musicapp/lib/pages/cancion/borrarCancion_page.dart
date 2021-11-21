import 'package:flutter/material.dart';

class BorrarCancionPage extends StatefulWidget {
  BorrarCancionPage({Key? key}) : super(key: key);

  @override
  _BorrarCancionPageState createState() => _BorrarCancionPageState();
}

class _BorrarCancionPageState extends State<BorrarCancionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrar Cancion'),
      ),
    );
  }
}
