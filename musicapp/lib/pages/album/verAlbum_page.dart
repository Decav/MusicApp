import 'package:flutter/material.dart';

class VerAlbumPage extends StatefulWidget {
  VerAlbumPage({Key? key}) : super(key: key);

  @override
  _VerAlbumPageState createState() => _VerAlbumPageState();
}

class _VerAlbumPageState extends State<VerAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Album'),
      ),
    );
  }
}
