import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/provider/artistas_provider.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class VerArtistaPage extends StatefulWidget {
  VerArtistaPage({Key? key}) : super(key: key);

  @override
  _VerArtistaPageState createState() => _VerArtistaPageState();
}

class _VerArtistaPageState extends State<VerArtistaPage> {
  ArtistasProvider provider = ArtistasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Artistas'),
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
                  leading: Icon(MdiIcons.accountBoxMultiple),
                  title: Text(snapshot.data[index]['nombre_artista']),
                  subtitle: Text("Género:  " + snapshot.data[index]['genero']),
                  trailing: Text(
                    " Año de debut:  " +
                        snapshot.data[index]['debut_year'].toString(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                );
              });
        },
      ),
    );
  }
}
