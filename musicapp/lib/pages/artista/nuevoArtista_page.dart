import 'dart:html';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NuevoArtistaPage extends StatefulWidget {
  NuevoArtistaPage({Key? key}) : super(key: key);

  @override
  _NuevoArtistaPageState createState() => _NuevoArtistaPageState();
}

class _NuevoArtistaPageState extends State<NuevoArtistaPage> {
  DateTime fecha_pasaje = DateTime.now();

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
          child: Column(
            children: [
              container(),
              inputNombreArtista(),
              container(),
              inputNombreCivil(),
              container(),
              fecha_input(),
              container(),
              inputGenero(),
              container(),
              inputYearDebut(),
              container(),
              inputBiografia(),
              container(),
              botonIngresar(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField inputNombreArtista() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese el nombre artistico:',
        suffixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  Container container() {
    return Container(
      height: 20,
    );
  }

  TextFormField inputNombreCivil() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese el nombre civil:',
        suffixIcon: Icon(MdiIcons.accountBox),
      ),
    );
  }

  TextFormField inputGenero() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese el género:',
        suffixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  TextFormField inputYearDebut() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Ingrese el año de debut:',
        suffixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  Row fecha_input() {
    return Row(
      children: [
        Text(
          'Fecha Ingresada: ' + formato_fecha.format(fecha_pasaje),
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
                fecha_pasaje = fecha == null ? fecha_pasaje : fecha;
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

  TextFormField inputBiografia() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Ingrese la Biografía:',
        suffixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  Widget botonIngresar() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Ingrese Nuevo Artista'),
        style: ElevatedButton.styleFrom(primary: Color(0xFFcecece)),
        onPressed: () {},
      ),
    );
  }
}
