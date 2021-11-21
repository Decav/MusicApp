import 'package:flutter/material.dart';

class ModificarAlbumPage extends StatefulWidget {
  ModificarAlbumPage({Key? key}) : super(key: key);

  @override
  _ModificarAlbumPageState createState() => _ModificarAlbumPageState();
}

class _ModificarAlbumPageState extends State<ModificarAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Album'),
      ),
    );
  }
}
