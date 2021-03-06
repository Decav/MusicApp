import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:musicapp/constants.dart';
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
            hintText: 'Ingrese el g??nero:',
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
            hintText: 'Ingrese el a??o de debut:',
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
          'Fecha nacimiento: ' + formato_fecha.format(fecha_nacimiento),
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
              locale: Locale('es', 'ES'),
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
            hintText: 'Ingrese la Biograf??a:',
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
          var yearr = DateTime.now().year;
          if (yearCtrl.text == "" || yearCtrl.text == "0") {
            textErrorYear = "Este valor no puede ser ni 0 ni vacio";
          } else if (yearr < int.parse(yearCtrl.text) - 1) {
            textErrorYear = "El a??o de debut debe ser menor que el a??o actual";
          } else if (1300 > int.parse(yearCtrl.text)) {
            textErrorYear = "El a??o no puede ser menor a 1300";
          } else {
            var resp = await provider.AgregarArtista(
                nombreArtCtrl.text,
                nombreRealCtrl.text,
                formato_fecha.format(fecha_nacimiento),
                generoCtrl.text,
                yearCtrl.text == "" ? 0 : int.parse(yearCtrl.text),
                biografiaCtrl.text);

            if (resp['message'] != null) {
              textErrorNombre = resp['errors']['nombre_artista'] == null
                  ? ""
                  : resp['errors']['nombre_artista'][0].toString();
              textErrorNombreC = resp['errors']['nombre_civil'] == null
                  ? ""
                  : resp['errors']['nombre_civil'][0].toString();
              textErrorGenero = resp['errors']['genero'] == null
                  ? ""
                  : resp['errors']['genero'][0].toString();
              textErrorYear = resp['errors']['debut_year'] == null
                  ? ""
                  : resp['errors']['debut_year'][0].toString();
            } else {
              textErrorNombre = "";
              textErrorNombreC = "";
              textErrorGenero = "";
              textErrorYear = "";
              if (resp.length != 0) {
                showSnackbar(
                    'Se ha creado con exito el artista ' + nombreArtCtrl.text);
                nombreArtCtrl.text = "";
                nombreRealCtrl.text = "";
                generoCtrl.text = "";
                yearCtrl.text = "";
                biografiaCtrl.text = "";
                fecha_nacimiento = DateTime.now();
              }
            }
          }

          setState(() {});
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
}
