import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/provider/album_artista_provider.dart';
import 'package:musicapp/provider/albumes_provider.dart';

class IntersecAlbumArtPage extends StatefulWidget {
  String nombre_artista;
  IntersecAlbumArtPage({Key? key, this.nombre_artista = ""}) : super(key: key);

  @override
  _IntersecAlbumArtPageState createState() => _IntersecAlbumArtPageState();
}

class _IntersecAlbumArtPageState extends State<IntersecAlbumArtPage> {
  String nombre_artista = "";
  AlbumArtistaProvider provider = AlbumArtistaProvider();
  AlbumsProvider album_provider = AlbumsProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nombre_artista = widget.nombre_artista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums según artista'),
      ),
      body: FutureBuilder(
        future: provider.getAlbumArtFiltro(nombre_artista),
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
          if (snapshot.data.length == 0) {
            return Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      left: 20,
                      right: 20,
                    ),
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
                    decoration: BoxDecoration(
                        color: KSecondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Icon(MdiIcons.robotDead),
                        Container(
                          padding: EdgeInsets.only(
                            top: 7,
                          ),
                          child: Text(
                            'Este artista no tiene ningún album asociado.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade800,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return ListView.separated(
              separatorBuilder: (_, __) => Divider(
                    thickness: 2.0,
                  ),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(MdiIcons.bookMusic),
                  title: Container(
                    child: FutureBuilder(
                        future: album_provider
                            .getAlbum(snapshot.data[index]['cod_album']),
                        builder: (context, AsyncSnapshot snapshot2) {
                          if (!snapshot2.hasData) {
                            return Center(child: LinearProgressIndicator());
                          }

                          return Container(
                            child: Text(snapshot2.data['nombre_album']),
                          );
                        }),
                  ),
                );
              });
        },
      ),
    );
  }
}
