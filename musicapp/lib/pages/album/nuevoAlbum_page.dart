import 'dart:html';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NuevoAlbumPage extends StatefulWidget {
  NuevoAlbumPage({Key? key}) : super(key: key);

  @override
  _NuevoAlbumPageState createState() => _NuevoAlbumPageState();
}

class _NuevoAlbumPageState extends State<NuevoAlbumPage> {
  DateTime fecha_pasaje = DateTime.now();
  var formato_fecha = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Album'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              container(),
              inputNombreAlbum(),
              container(),
              inputGenero(),
              container(),
              inputNombreGrupo(),
              container(),
              Container(
                height: 10,
              ),
              fecha_input(),
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

  TextFormField inputNombreAlbum() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese Nombre del Album:',
        suffixIcon: Icon(MdiIcons.bookMusic),
      ),
    );
  }

  TextFormField inputGenero() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese el Género musical:',
        suffixIcon: Icon(MdiIcons.formatListBulletedType),
      ),
    );
  }

  Row fecha_input() {
    return Row(
      children: [
        Text(
          'Ingrese Fecha de Lanzamiento: ' + formato_fecha.format(fecha_pasaje),
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
              )
            ],
          ),
        ),
      ],
    );
  }

  TextFormField inputNombreGrupo() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Ingrese el nombre del grupo musical(opcional):',
          suffixIcon: Icon(MdiIcons.accountGroup)),
    );
  }

  Widget botonIngresar() {
    return Container(
      width: 400,
      child: ElevatedButton(
        child: Text('Agregue Nuevo Album'),
        style: ElevatedButton.styleFrom(primary: Color(0xFF651FFF)),
        onPressed: () {},
      ),
    );
  }
}
