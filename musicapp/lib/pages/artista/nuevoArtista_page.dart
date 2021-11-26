import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/provider/artistas_provider.dart';

class NuevoArtistaPage extends StatefulWidget {
  NuevoArtistaPage({Key? key}) : super(key: key);

  @override
  _NuevoArtistaPageState createState() => _NuevoArtistaPageState();
}

class _NuevoArtistaPageState extends State<NuevoArtistaPage> {
  DateTime fecha_nacimiento = DateTime.now();
  TextEditingController nombreArtCtrl = TextEditingController();
  TextEditingController nombreRealCtrl = TextEditingController();
  TextEditingController fecha_nacCtrl = TextEditingController();
  TextEditingController yearCtrl = TextEditingController();
  TextEditingController generoCtrl = TextEditingController();
  TextEditingController biografiaCtrl = TextEditingController();
  ArtistasProvider provider = ArtistasProvider();
  String textErrorNombre = "";
  String textErrorNombreC = "";
  String textErrorGenero = "";
  String textErrorYear = "";
  String textErrorBiografia = "";

  var formato_fecha = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Artista'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: [
              container(),
              columnNombreArtista(),
              container(),
              columnNombreCivil(),
              container(),
              fecha_input(),
              container(),
              columnGenero(),
              container(),
              columnYearDebut(),
              container(),
              columnBiografia(),
              container(),
              botonIngresar(),
            ],
          ),
        ),
      ),
    );
  }

  Column columnNombreArtista() {
    return Column(
      children: [
        TextFormField(
          controller: nombreArtCtrl,
          decoration: InputDecoration(
            hintText: 'Ingrese el nombre artistico:',
            suffixIcon: Icon(MdiIcons.account),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            textErrorNombre,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Container container() {
    return Container(
      height: 20,
    );
  }

  Column columnNombreCivil() {
    return Column(
      children: [
        TextFormField(
          controller: nombreRealCtrl,
          decoration: InputDecoration(
            hintText: 'Ingrese el nombre civil:',
            suffixIcon: Icon(MdiIcons.accountBox),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            textErrorNombreC,
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
            hintText: 'Ingrese el género:',
            suffixIcon: Icon(MdiIcons.account),
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
            hintText: 'Ingrese el año de debut:',
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

  Row fecha_input() {
    return Row(
      children: [
        Text(
          'Fecha Ingresada: ' + formato_fecha.format(fecha_nacimiento),
          style: TextStyle(fontSize: 16, color: Color(0xFF787878)),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1500),
              lastDate: DateTime(2030),
            ).then((fecha) {
              setState(() {
                fecha_nacimiento = fecha == null ? fecha_nacimiento : fecha;
              });
            });
          },
          child: Row(
            children: [
              Text(
                'Elija una fecha',
                style: TextStyle(fontSize: 17, color: Color(0xFF651FFF)),
              ),
              Container(
                width: 7,
              ),
              Icon(
                MdiIcons.calendar,
                color: Color(0xFF651FFF),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column columnBiografia() {
    return Column(
      children: [
        TextFormField(
          controller: biografiaCtrl,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Ingrese la Biografía:',
            suffixIcon: Icon(MdiIcons.account),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            textErrorBiografia,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget botonIngresar() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Ingrese Nuevo Artista'),
        style: ElevatedButton.styleFrom(primary: Color(0xFF651FFF)),
        onPressed: () async {
          var resp = await provider.AgregarArtista(
              nombreArtCtrl.text,
              nombreRealCtrl.text,
              formato_fecha.format(fecha_nacimiento),
              generoCtrl.text,
              int.parse(yearCtrl.text),
              biografiaCtrl.text);
          Navigator.pop(context);
          if (resp['message'] != null) {
            textErrorNombre = resp['errors']['nombre_artista'];
          }
        },
      ),
    );
  }
}
