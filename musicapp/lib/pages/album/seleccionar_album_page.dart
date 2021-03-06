import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/provider/album_artista_provider.dart';
import 'package:musicapp/provider/albumes_provider.dart';

class SeleccionarAlbumPage extends StatefulWidget {
  String nombre_artista;
  SeleccionarAlbumPage({Key? key, this.nombre_artista = ""}) : super(key: key);

  @override
  _SeleccionarAlbumPageState createState() => _SeleccionarAlbumPageState();
}

class _SeleccionarAlbumPageState extends State<SeleccionarAlbumPage> {
  AlbumsProvider provider = AlbumsProvider();
  AlbumArtistaProvider albArtista_provider = AlbumArtistaProvider();
  String nombre_artista = "";
  @override
  void initState() {
    super.initState();
    nombre_artista = widget.nombre_artista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione un Album para enlazar'),
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
          if (snapshot.data.length != 0) {
            return ListView.separated(
                separatorBuilder: (_, __) => Divider(
                      thickness: 2.0,
                    ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: FutureBuilder(
                      future: albArtista_provider.getAlbumArtistas(),
                      builder: (context, AsyncSnapshot snapshot2) {
                        if (!snapshot2.hasData) {
                          return Center(
                            child: Container(
                              padding:
                                  EdgeInsets.only(top: 10, right: 50, left: 50),
                              child: LinearProgressIndicator(),
                            ),
                          );
                        }
                        bool existe = false;
                        for (int i = 0; i < snapshot2.data.length; i++) {
                          if (snapshot.data[index]['id'] ==
                                  snapshot2.data[i]['cod_album'] &&
                              nombre_artista ==
                                  snapshot2.data[i]['nombre_artista']) {
                            existe = true;
                          }
                        }
                        return ListTile(
                          enabled: !existe,
                          leading: Icon(MdiIcons.bookMusic),
                          title: Text(snapshot.data[index]['nombre_album']),
                          subtitle: Text(snapshot.data[index]
                                      ['lanzamiento_year']
                                  .toString() +
                              "   " +
                              snapshot.data[index]['genero_musical']),
                          onTap: () async {
                            var resp = await provider.crearRelacion(
                                nombre_artista, snapshot.data[index]['id']);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  );
                });
          }

          return Center(
            child: Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  color: KPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Center(
                child: Text(
                  'No se encuentra ningun album ingresado.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
