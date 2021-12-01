import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/album_page.dart';
import 'package:musicapp/pages/artista_page.dart';
import 'package:musicapp/pages/albumArtista_page.dart';

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
    AlbumxArtistaPage()
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
            child: Image(
              image: AssetImage('assets/imagenes/Imagen_musica.jpg'),
            ),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.cyan.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Column(
                children: [
                  Container(
                      child: Icon(MdiIcons.music),
                      alignment: Alignment.centerLeft),
                  Container(
                    padding: EdgeInsets.fromLTRB(3, 7, 3, 7),
                    child: Text(
                      "En esta aplicación vas a poder agregar artistas y sus albums. Ademas de poder ver lo que has creado.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.musicNote),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
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
              title: Text('Artistas y Albums'),
              leading: Icon(
                MdiIcons.bookSearchOutline,
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
      AlbumxArtistaPage()
    ];

    final route = MaterialPageRoute(builder: (ctx) {
      return paginas[page];
    });
    Navigator.push(ctx, route);
  }
}
