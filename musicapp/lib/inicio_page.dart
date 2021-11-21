import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/album_page.dart';
import 'package:musicapp/pages/artista_page.dart';
import 'package:musicapp/pages/cancion_page.dart';

class InicioPage extends StatefulWidget {
  InicioPage({Key? key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  List<Widget> paginas = [
    InicioPage(),
    ArtistaPage(),
    AlbumPage(),
    CancionPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenidos a Music-App'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Hola',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
            ListTile(
              title: Text('Inicio'),
              leading: Icon(
                MdiIcons.home,
                color: Colors.black,
              ),
              trailing: Icon(MdiIcons.arrowRight),
              onTap: () => changePage(context, 0),
            ),
            Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
            ListTile(
              title: Text('Artistas'),
              leading: Icon(
                MdiIcons.guitarElectric,
                color: Colors.black,
              ),
              trailing: Icon(MdiIcons.arrowRight),
              onTap: () => changePage(context, 1),
            ),
            Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
            ListTile(
              title: Text('Albumes'),
              leading: Icon(
                MdiIcons.album,
                color: Colors.black,
              ),
              trailing: Icon(MdiIcons.arrowRight),
              onTap: () => changePage(context, 2),
            ),
            Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
            ListTile(
              title: Text('Canciones'),
              leading: Icon(
                MdiIcons.music,
                color: Colors.black,
              ),
              trailing: Icon(MdiIcons.arrowRight),
              onTap: () => changePage(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  void changePage(BuildContext ctx, int page) {
    List<Widget> paginas = [
      InicioPage(),
      ArtistaPage(),
      AlbumPage(),
      CancionPage()
    ];

    final route = MaterialPageRoute(builder: (ctx) {
      return paginas[page];
    });
    Navigator.push(ctx, route);
  }
}
