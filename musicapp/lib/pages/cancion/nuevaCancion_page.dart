import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NuevaCancionPage extends StatefulWidget {
  NuevaCancionPage({Key? key}) : super(key: key);

  @override
  _NuevaCancionPageState createState() => _NuevaCancionPageState();
}

class _NuevaCancionPageState extends State<NuevaCancionPage> {
  DateTime fecha_pasaje = DateTime.now();
  var formato_fecha = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Canción'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              inputNombreCancion(),
              container(),
              fecha_input(),
              container(),
              inputDropDown(),
              Spacer(),
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

  TextFormField inputNombreCancion() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese el nombre de la canción:',
        suffixIcon: Icon(MdiIcons.bookmarkMusic),
      ),
    );
  }

  Row fecha_input() {
    return Row(
      children: [
        Text(
          'Fecha de lanzamiento: ' + formato_fecha.format(fecha_pasaje),
          style: TextStyle(fontSize: 15, color: Color(0xFF787878)),
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

  TextFormField inputDropDown() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese el nombre del Album:',
        suffixIcon: Text('DropDown'),
      ),
    );
  }

  Widget botonIngresar() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Agregue una nueva canción'),
        style: ElevatedButton.styleFrom(primary: Color(0xFFcecece)),
        onPressed: () {},
      ),
    );
  }
}
