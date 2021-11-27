import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/pages/album/botones_new_page.dart';
import 'package:musicapp/pages/album/form_new_album_page.dart';
import 'package:musicapp/provider/albumes_provider.dart';
import 'package:musicapp/provider/artistas_provider.dart';

class NuevoAlbumPage extends StatefulWidget {
  NuevoAlbumPage({Key? key}) : super(key: key);

  @override
  _NuevoAlbumPageState createState() => _NuevoAlbumPageState();
}

class _NuevoAlbumPageState extends State<NuevoAlbumPage> {
  ArtistasProvider provider = ArtistasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Album'),
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
                  leading: Icon(MdiIcons.accountBox),
                  title: Text(snapshot.data[index]['nombre_artista']),
                  trailing: ElevatedButton(
                    child: Text('Seleccione el artista'),
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => BotonesNewPage(
                          nombre_artista:
                              snapshot.data[index]['nombre_artista'].toString(),
                        ),
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
