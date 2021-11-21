import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/cancion/borrarCancion_page.dart';
import 'package:musicapp/pages/cancion/modificarCancion_page.dart';
import 'package:musicapp/pages/cancion/nuevaCancion_page.dart';
import 'package:musicapp/pages/cancion/verCancion_page.dart';

class CancionPage extends StatefulWidget {
  CancionPage({Key? key}) : super(key: key);

  @override
  _CancionPageState createState() => _CancionPageState();
}

class _CancionPageState extends State<CancionPage> {
  int _indice = 0;
  List<Widget> _crudPages = [
    NuevaCancionPage(),
    VerCancionPage(),
    BorrarCancionPage(),
    ModificarCancionPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _crudPages[_indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple.shade100,
        unselectedItemColor: Colors.indigo.shade300,
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.chevronTripleRight),
            label: 'Nueva Cancion',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.chevronTripleRight),
            label: 'Ver Cancion',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.chevronTripleRight),
            label: 'Borrar Cancion',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.chevronTripleRight),
            label: 'Modificar Cancion',
          ),
        ],
        currentIndex: _indice,
        onTap: (indice) {
          setState(() {
            _indice = indice;
          });
        },
      ),
    );
  }
}
