import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/artista/borrarArtista_page.dart';
import 'package:musicapp/pages/artista/modificarArtista_page.dart';
import 'package:musicapp/pages/artista/nuevoArtista_page.dart';
import 'package:musicapp/pages/artista/verArtista_page.dart';

class ArtistaPage extends StatefulWidget {
  ArtistaPage({Key? key}) : super(key: key);

  @override
  _ArtistaPageState createState() => _ArtistaPageState();
}

class _ArtistaPageState extends State<ArtistaPage> {
  int _indice = 0;
  List<Widget> _crudPages = [
    NuevoArtistaPage(),
    VerArtistaPage(),
    BorrarArtista(),
    ModificarArtistaPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _crudPages[_indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade500,
        unselectedItemColor: Colors.yellow.shade700,
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.plus),
            label: 'Nuevo Artista',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.table),
            label: 'Ver Artista',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.trashCan),
            label: 'Borrar Artista',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bookEdit),
            label: 'Modificar Artista',
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
