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

  Future<LinkedHashMap<String, dynamic>> agregarAlbum(String nombre_album,
      int lanzamiento_year, String genero_musical, String nombre_grupo) async {
    var uri = Uri.parse('$apiURL/artistas');
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
        },
      ),
    );
    return json.decode(respuesta.body);
  }
}
