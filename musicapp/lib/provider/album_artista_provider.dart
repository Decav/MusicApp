import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AlbumArtistaProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';
  Future<List<dynamic>> getAlbumArtistas() async {
    var uri = Uri.parse('$apiURL/album_artistas');
    var respuesta = await http.get(uri);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getAlbumArtFiltro(String nombre) async {
    var uri = Uri.parse('$apiURL/album_artistas/$nombre');
    var respuesta = await http.get(uri);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}
