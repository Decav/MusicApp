import 'package:flutter/material.dart';

class BorrarArtista extends StatefulWidget {
  BorrarArtista({Key? key}) : super(key: key);

  @override
  _BorrarArtistaState createState() => _BorrarArtistaState();
}

class _BorrarArtistaState extends State<BorrarArtista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrar artistas'),
      ),
    );
  }
}
