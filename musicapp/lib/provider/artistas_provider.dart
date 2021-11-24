import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musicapp/pages/artista/nuevoArtista_page.dart';

class ArtistasProvider {
  final String apiURL = 'http://127.0.0.1:8000/api';
  Future<List<dynamic>> getArtistas() async {
    var uri = Uri.parse('$apiURL/artistas/get');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> AgregarArtista(
      String nombre_artista,
      String nombre_civil,
      DateTime fecha_nacimiento,
      String genero,
      int debut_year,
      String biografia) async {
    var uri = Uri.parse('$apiURL/artistas/post');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, String>{
          'nombre_artista': nombre_artista,
          'nombre_civil': nombre_civil = "",
          'fecha_nacimiento': fecha_nacimiento.toString(),
          'genero': genero,
          'debut_year': debut_year.toString(),
          'biografia': biografia = "",
        },
      ),
    );
    return json.decode(respuesta.body);
  }
}
