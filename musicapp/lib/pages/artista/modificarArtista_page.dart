import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/artista/formModificar_page.dart';
import 'package:musicapp/provider/artistas_provider.dart';

class ModificarArtistaPage extends StatefulWidget {
  ModificarArtistaPage({Key? key}) : super(key: key);

  @override
  _ModificarArtistaPageState createState() => _ModificarArtistaPageState();
}

class _ModificarArtistaPageState extends State<ModificarArtistaPage> {
  ArtistasProvider provider = ArtistasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar artistas'),
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
                  key: ObjectKey(snapshot.data[index]['nombre_artista']),
                  leading: Icon(MdiIcons.accountBox),
                  title: Text(snapshot.data[index]['nombre_artista']),
                  subtitle: Text(snapshot.data[index]['genero']),
                  trailing: ElevatedButton(
                    child: Text('Actualizar'),
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => FormModificarPage(
                          nombre_artista:
                              snapshot.data[index]['nombre_artista'].toString(),
                          nombre_civil:
                              snapshot.data[index]['nombre_civil'].toString(),
                          fecha_nacimiento: snapshot.data[index]
                                  ['fecha_nacimiento']
                              .toString(),
                          genero: snapshot.data[index]['genero'].toString(),
                          year_debut: snapshot.data[index]['debut_year'],
                          biografia:
                              snapshot.data[index]['biografia'].toString(),
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
