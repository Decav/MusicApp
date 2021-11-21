import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/album/borrarAlbum_page.dart';
import 'package:musicapp/pages/album/modificarAlbum_page.dart';
import 'package:musicapp/pages/album/nuevoAlbum_page.dart';
import 'package:musicapp/pages/album/verAlbum_page.dart';

class AlbumPage extends StatefulWidget {
  AlbumPage({Key? key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  int _indice = 0;
  List<Widget> _crudPages = [
    NuevoAlbumPage(),
    VerAlbumPage(),
    BorrarAlbumPage(),
    ModificarAlbumPage()
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
            icon: Icon(MdiIcons.plus),
            label: 'Nuevo Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.table),
            label: 'Ver Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.trashCan),
            label: 'Borrar Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bookEdit),
            label: 'Modificar Album',
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
