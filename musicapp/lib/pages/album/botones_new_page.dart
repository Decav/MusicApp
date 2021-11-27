import 'package:flutter/material.dart';
import 'package:musicapp/pages/album/form_new_album_page.dart';
import 'package:musicapp/pages/album/seleccionar_album_page.dart';

class BotonesNewPage extends StatefulWidget {
  String nombre_artista;
  BotonesNewPage({Key? key, this.nombre_artista = ""}) : super(key: key);

  @override
  _BotonesNewPageState createState() => _BotonesNewPageState();
}

class _BotonesNewPageState extends State<BotonesNewPage> {
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
        title: Text('Acciones: '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              ElevatedButton(
                child: Text(
                  'Crear nuevo Album',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Color(0xFF651FFF)),
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => FormNewAlbumPage(
                      nombre_artista: nombre_artista,
                    ),
                  );
                  Navigator.push(context, route);
                },
              ),
              Container(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Seleccionar un album ya existente'),
                style: ElevatedButton.styleFrom(primary: Color(0xFFFDD835)),
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => SeleccionarAlbumPage(
                      nombre_artista: nombre_artista,
                    ),
                  );
                  Navigator.push(context, route);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
