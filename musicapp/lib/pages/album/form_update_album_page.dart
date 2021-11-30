import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
import 'package:musicapp/provider/albumes_provider.dart';
import 'package:musicapp/provider/artistas_provider.dart';

class FormUpdateAlbumPage extends StatefulWidget {
  int id_album;
  String nombre_album;
  int lanzamiento_year;
  String genero;
  String nombre_grupo;
  FormUpdateAlbumPage(
      {Key? key,
      this.id_album = 0,
      this.nombre_album = "",
      this.lanzamiento_year = 0,
      this.genero = "",
      this.nombre_grupo = ""})
      : super(key: key);

  @override
  _FormUpdateAlbumPageState createState() => _FormUpdateAlbumPageState();
}

class _FormUpdateAlbumPageState extends State<FormUpdateAlbumPage> {
  AlbumsProvider provider = AlbumsProvider();
  int id_album = 0;
  TextEditingController nombreAlbumCtrl = TextEditingController();
  TextEditingController yearCtrl = TextEditingController();
  TextEditingController generoCtrl = TextEditingController();
  TextEditingController nombreGrupoCtrl = TextEditingController();
  String textErrorNombreAlbum = "";
  String textErrorGenero = "";
  String textErrorYear = "";
  String textErrorNombreGrupo = "";
  String nombre_artista = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id_album = widget.id_album;
    nombreAlbumCtrl.text = widget.nombre_album;
    yearCtrl.text = widget.lanzamiento_year.toString();
    generoCtrl.text = widget.genero;
    nombreGrupoCtrl.text =
        widget.nombre_grupo == "null" ? "" : widget.nombre_grupo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualiza el album'),
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
        child: Text('Actualice Album'),
        style: ElevatedButton.styleFrom(primary: KPrimaryColor),
        onPressed: () async {
          if (yearCtrl.text == "" || yearCtrl.text == "0") {
            textErrorYear = "Este valor no puede ser ni 0 ni vacio";
          } else {
            var resp = await provider.actualizarAlbum(
                id_album,
                nombreAlbumCtrl.text,
                nombreGrupoCtrl.text,
                int.parse(yearCtrl.text),
                generoCtrl.text);
            if (resp['message'] != null) {
              textErrorNombreAlbum = resp['errors']['nombre_album'] == null
                  ? ""
                  : resp['errors']['nombre_album'][0].toString();
              textErrorYear = resp['errors']['lanzamiento_year'] == null
                  ? ""
                  : resp['errors']['lanzamiento_year'][0].toString();
              textErrorGenero = resp['errors']['genero_musical'] == null
                  ? ""
                  : resp['errors']['genero_musical'][0].toString();
            } else {
              textErrorNombreAlbum = "";
              textErrorNombreGrupo = "";
              textErrorGenero = "";
              textErrorYear = "";
            }
          }

          setState(() {});
        },
      ),
    );
  }
}
