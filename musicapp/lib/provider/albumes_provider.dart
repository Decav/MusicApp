import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AlbumsProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';
  Future<List<dynamic>> getAlbums() async {
    var uri = Uri.parse('$apiURL/albums');
    var respuesta = await http.get(uri);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> getAlbum(int id) async {
    var uri = Uri.parse('$apiURL/albums/$id');
    var respuesta = await http.get(uri);
    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> agregarAlbum(
      String nombre_album,
      int lanzamiento_year,
      String genero_musical,
      String nombre_grupo,
      String nombre_artista) async {
    var uri = Uri.parse('$apiURL/albums');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          'nombre_album': nombre_album,
          'lanzamiento_year': lanzamiento_year,
          'genero_musical': genero_musical,
          'nombre_grupo': nombre_grupo,
          'nombre_artista': nombre_artista,
        },
      ),
    );

    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> crearRelacion(
      String nombre_artista, int cod_album) async {
    var uri = Uri.parse('$apiURL/album_artistas');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          'nombre_artista': nombre_artista,
          'cod_album': cod_album
        },
      ),
    );

    return json.decode(respuesta.body);
  }

  Future<bool> eliminarAlbum(int id) async {
    var uri = Uri.parse('$apiURL/albums/$id');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

  Future<LinkedHashMap<String, dynamic>> actualizarAlbum(
      int id,
      String nombre_album,
      String nombre_grupo,
      int lanzamiento_year,
      String genero_musical) async {
    var uri = Uri.parse('$apiURL/albums/$id');
    var respuesta = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          'id': id,
          'nombre_album': nombre_album,
          'lanzamiento_year': lanzamiento_year,
          'genero_musical': genero_musical,
          'nombre_grupo': nombre_grupo
        },
      ),
    );
    return json.decode(respuesta.body);
  }
}
