import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/provider/artistas_provider.dart';

class BorrarArtista extends StatefulWidget {
  BorrarArtista({Key? key}) : super(key: key);

  @override
  _BorrarArtistaState createState() => _BorrarArtistaState();
}

class _BorrarArtistaState extends State<BorrarArtista> {
  ArtistasProvider provider = ArtistasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrar artistas'),
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
                  key: ObjectKey(snapshot.data[index]['nombre_artista']),
                  leading: Icon(MdiIcons.accountBox),
                  title: Text(snapshot.data[index]['nombre_artista']),
                  subtitle: Text(snapshot.data[index]['genero']),
                  trailing: ElevatedButton(
                    child: Text('Eliminar'),
                    onPressed: () {
                      confirmDialog(
                              context, snapshot.data[index]['nombre_artista'])
                          .then((respuestaConfirm) {
                        if (respuestaConfirm) {
                          var nombre = snapshot.data[index]['nombre_artista']
                              .toString()
                              .trim();
                          print(nombre);
                          setState(() {
                            provider
                                .eliminarArtista(nombre)
                                .then((borradoExitoso) {
                              if (borradoExitoso) {
                                showSnackbar('Se ha borrado con Exito');
                              } else {
                                showSnackbar('Algo salió mal');
                              }
                            });
                          });
                        }
                      });
                      /*
                      var nombre = snapshot.data[index]['nombre_artista']
                          .toString()
                          .trim();
                      print(nombre);
                      setState(() {
                        provider.eliminarArtista(nombre).then((borradoExitoso) {
                          if (borradoExitoso) {
                            showSnackbar('Se ha borrado con Exito', MdiIcons.);
                          }
                          else{
                            showSnackbar('Algo salió mal');
                          }
                        });
                      });*/
                    },
                  ),
                );
              });
        },
      ),
    );
  }

  void showSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensaje,
          style: TextStyle(color: Colors.white),
        ),
        //duration: Duration(seconds: 3),
        backgroundColor: KPrimaryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String _nombre) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar borrado del Artista'),
          content: Text('¿Desea borrar $_nombre de la tabla Artistas?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('CANCELAR'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('ACEPTAR'),
            ),
          ],
        );
      },
    );
  }
}
