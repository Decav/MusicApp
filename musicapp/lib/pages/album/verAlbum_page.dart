import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/provider/albumes_provider.dart';

class VerAlbumPage extends StatefulWidget {
  VerAlbumPage({Key? key}) : super(key: key);

  @override
  _VerAlbumPageState createState() => _VerAlbumPageState();
}

class _VerAlbumPageState extends State<VerAlbumPage> {
  AlbumsProvider provider = AlbumsProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Album'),
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
                  leading: Icon(MdiIcons.bookMusic),
                  title: Text(snapshot.data[index]['nombre_album']),
                  subtitle: Text("Género musical: " +
                      snapshot.data[index]['genero_musical']),
                  trailing: Text(
                    " Año de lanzamiento:  " +
                        snapshot.data[index]['lanzamiento_year'].toString(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                );
              });
        },
      ),
    );
  }
}
