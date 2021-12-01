import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/pages/album/form_update_album_page.dart';
import 'package:musicapp/provider/albumes_provider.dart';

class ModificarAlbumPage extends StatefulWidget {
  ModificarAlbumPage({Key? key}) : super(key: key);

  @override
  _ModificarAlbumPageState createState() => _ModificarAlbumPageState();
}

class _ModificarAlbumPageState extends State<ModificarAlbumPage> {
  AlbumsProvider provider = AlbumsProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Album'),
      ),
      body: FutureBuilder(
        future: provider.getAlbums(),
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
                  key: ObjectKey(snapshot.data[index]['id']),
                  leading: Icon(MdiIcons.bookEdit),
                  title: Text(snapshot.data[index]['nombre_album']),
                  subtitle: Text(snapshot.data[index]['genero_musical']),
                  trailing: ElevatedButton(
                    child: Text('Actualizar'),
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) => FormUpdateAlbumPage(
                                id_album: snapshot.data[index]['id'],
                                nombre_album: snapshot.data[index]
                                        ['nombre_album']
                                    .toString(),
                                lanzamiento_year: snapshot.data[index]
                                    ['lanzamiento_year'],
                                genero: snapshot.data[index]['genero_musical']
                                    .toString(),
                                nombre_grupo: snapshot.data[index]
                                        ['nombre_grupo']
                                    .toString(),
                              ));
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
