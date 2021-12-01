import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/interseccion/intersec_album_art_page.dart';
import 'package:musicapp/provider/album_artista_provider.dart';
import 'package:musicapp/provider/albumes_provider.dart';
import 'package:musicapp/provider/artistas_provider.dart';

import '../constants.dart';

class AlbumxArtistaPage extends StatefulWidget {
  AlbumxArtistaPage({Key? key}) : super(key: key);

  @override
  _AlbumxArtistaPageState createState() => _AlbumxArtistaPageState();
}

class _AlbumxArtistaPageState extends State<AlbumxArtistaPage> {
  ArtistasProvider provider = ArtistasProvider();

  String nombre_album = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums por artistas'),
      ),
      body: FutureBuilder(
        future: provider.getArtistas(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: LiquidLinearProgressIndicator(
                value: 0.25,
                valueColor: AlwaysStoppedAnimation(KPrimaryColor),
                backgroundColor: Colors.white,
                borderColor: KPrimaryColor,
                borderWidth: 5.0,
                borderRadius: 12.0,
                direction: Axis.vertical,
                center: Text("Cargando..."),
              ),
            );
          }
          return ListView.separated(
              separatorBuilder: (_, __) => Divider(
                    thickness: 2.0,
                  ),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(MdiIcons.bookAccount),
                  title: Text(snapshot.data[index]['nombre_artista']),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: KSecondaryColor),
                    child: Text(
                      'Ver Albums',
                      style: TextStyle(color: Colors.brown),
                    ),
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => IntersecAlbumArtPage(
                            nombre_artista: snapshot.data[index]
                                ['nombre_artista']),
                      );
                      Navigator.push(context, route);
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
