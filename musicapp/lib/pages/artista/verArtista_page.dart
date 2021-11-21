import 'package:flutter/material.dart';

class VerArtistaPage extends StatefulWidget {
  VerArtistaPage({Key? key}) : super(key: key);

  @override
  _VerArtistaPageState createState() => _VerArtistaPageState();
}

class _VerArtistaPageState extends State<VerArtistaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Artistas'),
      ),
    );
  }
}
