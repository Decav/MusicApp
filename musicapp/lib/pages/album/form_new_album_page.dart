import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/provider/albumes_provider.dart';
import 'package:musicapp/provider/artistas_provider.dart';

class FormNewAlbumPage extends StatefulWidget {
  String nombre_artista;
  FormNewAlbumPage({Key? key, this.nombre_artista = ""}) : super(key: key);

  @override
  _FormNewAlbumPageState createState() => _FormNewAlbumPageState();
}

class _FormNewAlbumPageState extends State<FormNewAlbumPage> {
  TextEditingController nombreAlbumCtrl = TextEditingController();
  TextEditingController yearCtrl = TextEditingController();
  TextEditingController generoCtrl = TextEditingController();
  TextEditingController nombreGrupoCtrl = TextEditingController();
  ArtistasProvider artistas_provider = ArtistasProvider();
  AlbumsProvider albums_provider = AlbumsProvider();
  String textErrorNombreAlbum = "";
  String textErrorGenero = "";
  String textErrorYear = "";
  String textErrorNombreGrupo = "";
  //DateTime fecha_pasaje = DateTime.now();
  //var formato_fecha = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Album'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: [
              container(),
              columnNombreAlbum(),
              container(),
              columnGenero(),
              container(),
              columnNombreGrupo(),
              container(),
              columnYearDebut(),
              container(),
              botonIngresar(),
            ],
          ),
        ),
      ),
    );
  }

  Container container() {
    return Container(
      height: 20,
    );
  }

  Column columnNombreAlbum() {
    return Column(
      children: [
        TextFormField(
          controller: nombreAlbumCtrl,
          decoration: InputDecoration(
            hintText: 'Ingrese Nombre del Album:',
            suffixIcon: Icon(MdiIcons.bookMusic),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            textErrorNombreAlbum,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Column columnGenero() {
    return Column(
      children: [
        TextFormField(
          controller: generoCtrl,
          decoration: InputDecoration(
            hintText: 'Ingrese el Género musical:',
            suffixIcon: Icon(MdiIcons.formatListBulletedType),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            textErrorGenero,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Column columnYearDebut() {
    return Column(
      children: [
        TextFormField(
          controller: yearCtrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Ingrese el año de lanzamiento:',
            suffixIcon: Icon(MdiIcons.calendar),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            textErrorYear,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Column columnNombreGrupo() {
    return Column(
      children: [
        TextFormField(
          controller: nombreGrupoCtrl,
          decoration: InputDecoration(
              hintText: 'Ingrese el nombre del grupo musical(opcional):',
              suffixIcon: Icon(MdiIcons.accountGroup)),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            textErrorNombreGrupo,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget botonIngresar() {
    return Container(
      width: 400,
      child: ElevatedButton(
        child: Text('Agregue Nuevo Album'),
        style: ElevatedButton.styleFrom(primary: KPrimaryColor),
        onPressed: () {},
      ),
    );
  }
}