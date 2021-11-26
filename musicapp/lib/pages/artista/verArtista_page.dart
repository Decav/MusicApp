import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/provider/artistas_provider.dart';

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
              child: CircularProgressIndicator(),
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
                  subtitle: Text(snapshot.data[index]['genero']),
                );
              });
        },
      ),
    );
  }
}
