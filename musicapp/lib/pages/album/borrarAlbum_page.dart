import 'package:flutter/material.dart';

class BorrarAlbumPage extends StatefulWidget {
  BorrarAlbumPage({Key? key}) : super(key: key);

  @override
  _BorrarAlbumPageState createState() => _BorrarAlbumPageState();
}

class _BorrarAlbumPageState extends State<BorrarAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrar Album'),
      ),
    );
  }
}
