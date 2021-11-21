import 'package:flutter/material.dart';

class VerCancionPage extends StatefulWidget {
  VerCancionPage({Key? key}) : super(key: key);

  @override
  _VerCancionPageState createState() => _VerCancionPageState();
}

class _VerCancionPageState extends State<VerCancionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Canciones'),
      ),
    );
  }
}
