import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musicapp/pages/artista/nuevoArtista_page.dart';

class ArtistasProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';
  Future<List<dynamic>> getArtistas() async {
    var uri = Uri.parse('$apiURL/artistas');
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
      String fecha_nacimiento,
      String genero,
      int debut_year,
      String biografia) async {
    var uri = Uri.parse('$apiURL/artistas');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          'nombre_artista': nombre_artista,
          'nombre_civil': nombre_civil,
          'fecha_nacimiento': fecha_nacimiento,
          'genero': genero,
          'debut_year': debut_year,
          'biografia': biografia,
        },
      ),
    );
    return json.decode(respuesta.body);
  }

  Future<bool> eliminarArtista(String nombre) async {
    var uri = Uri.parse('$apiURL/artistas/$nombre');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

  Future<LinkedHashMap<String, dynamic>> getArtistaNombre(String nombre) async {
    var uri = Uri.parse('$apiURL/artistas/$nombre');
    var respuesta = await http.get(uri);
    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> ActualizarArtista(
      String nombre_artista,
      String nombre_civil,
      String fecha_nacimiento,
      String genero,
      int debut_year,
      String biografia) async {
    var uri = Uri.parse('$apiURL/artistas/$nombre_artista');
    var respuesta = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          'nombre_artista': nombre_artista,
          'nombre_civil': nombre_civil,
          'fecha_nacimiento': fecha_nacimiento,
          'genero': genero,
          'debut_year': debut_year,
          'biografia': biografia,
        },
      ),
    );
    return json.decode(respuesta.body);
  }
}
