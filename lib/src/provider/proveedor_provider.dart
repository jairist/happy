import 'dart:convert';

import 'package:happy/src/models/proveedor.dart';
import 'package:happy/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class ProveedorProvider {
  final String _url = 'https://happy-a6611.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProveedor(ProveedorModelo proveedorModelo) async {
    final url = '$_url/proveedores.json?auth=${_prefs.token}';
    //https://happy-a6611.firebaseio.com/proveedores.json

    final resp =
        await http.post(url, body: proveedorModeloToJson(proveedorModelo));

    final decodedData = json.decode(resp.body);
    print('$decodedData');

    return true;
  }

  Future<List<ProveedorModelo>> cargarProveedores() async {
    final url = '$_url/proveedores.json?auth=${_prefs.token}';

    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);

    if (decodeData == null) return [];

    print(decodeData);

    final List<ProveedorModelo> proveedores = new List();

    decodeData.forEach((id, prov) {
      final provTemp = ProveedorModelo.fromJson(prov);
      provTemp.id = id;

      proveedores.add(provTemp);
    });

    return proveedores;
  }

  Future<List<String>> cargarProveedoresPorServicio(
      String nombreServicio) async {
    final url = '$_url/proveedores.json?auth=${_prefs.token}';

    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);

    if (decodeData == null) return [];

    print('Servicio evaluado : $nombreServicio');

    final List<String> proveedores = new List();
    proveedores.add('');

    decodeData.forEach((id, prov) {
      final provTemp = ProveedorModelo.fromJson(prov);
      provTemp.id = id;
      print('Iterando ${provTemp.servicio}');
      if (provTemp.servicio == nombreServicio) {
        print('Agregando ${provTemp.nombre}');
        proveedores.add(provTemp.nombre);
      }
    });
    print('proveedores del servicios seleccionado : $proveedores');
    return proveedores;
  }

  Future<int> borrarProveedor(String id) async {
    final url = '$_url/proveedor/$id.json?auth=${_prefs.token}';
    print(url);

    final resp = await http.delete(url);

    print(resp.statusCode);

    return 1;
  }
}
