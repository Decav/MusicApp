import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/pages/artista/modificarArtista_page.dart';
import 'package:musicapp/provider/artistas_provider.dart';

class FormModificarPage extends StatefulWidget {
  String nombre_artista;
  String nombre_civil;
  String genero;
  String fecha_nacimiento;
  int year_debut;
  String biografia;
  FormModificarPage(
      {Key? key,
      this.nombre_artista = "",
      this.nombre_civil = "",
      this.genero = "",
      this.fecha_nacimiento = "",
      this.year_debut = 0,
      this.biografia = ""})
      : super(key: key);

  @override
  _FormModificarPageState createState() => _FormModificarPageState();
}

class _FormModificarPageState extends State<FormModificarPage> {
  var formato_fecha = DateFormat('yyyy-MM-dd');
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
  var fecha_string = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nombreArtCtrl.text = widget.nombre_artista;
    nombreRealCtrl.text =
        widget.nombre_civil == "null" ? "" : widget.nombre_civil;
    generoCtrl.text = widget.genero;
    yearCtrl.text = widget.year_debut.toString();
    fecha_string = widget.fecha_nacimiento;
    biografiaCtrl.text = widget.biografia == "null" ? "" : widget.biografia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artista a Actualizar'),
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
          enabled: false,
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
          'Fecha Ingresada: ' + fecha_string,
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
                fecha_string = formato_fecha.format(fecha_nacimiento);
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
        child: Text('Actualizar datos del artista'),
        style: ElevatedButton.styleFrom(primary: Color(0xFF651FFF)),
        onPressed: () async {
          if (yearCtrl.text == "" || yearCtrl.text == "0") {
            textErrorYear = "Este valor no puede ser ni 0 ni vacio";
          } else {
            var resp = await provider.ActualizarArtista(
                nombreArtCtrl.text,
                nombreRealCtrl.text,
                formato_fecha.format(fecha_nacimiento),
                generoCtrl.text,
                yearCtrl.text == "" ? 0 : int.parse(yearCtrl.text),
                biografiaCtrl.text);
            print(resp);
            if (resp['message'] != null) {
              /*textErrorNombre = resp['errors']['nombre_artista'] == null
                  ? ""
                  : resp['errors']['nombre_artista'].toString();
              textErrorNombreC = resp['errors']['nombre_civil'] == null
                  ? ""
                  : resp['errors']['nombre_civil'].toString();
              textErrorGenero = resp['errors']['genero'] == null
                  ? ""
                  : resp['errors']['genero'].toString();
              textErrorYear = resp['errors']['debut_year'] == null
                  ? ""
                  : resp['errors']['debut_year'].toString();*/
            } else {
              textErrorNombre = "";
              textErrorNombreC = "";
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
