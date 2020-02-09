import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:happy/src/models/evaluacion_model.dart';

class EvaluacionProvider{

  final String _url = 'https://happy-a6611.firebaseio.com';


  Future<bool> crearEvaluacion(EvaluacionModelo evaluacionModelo) async{
    final url = '$_url/evaluaciones.json';

    final resp = await http.post(url, body: evaluacionModeloToJson(evaluacionModelo));

    final decodedData = json.decode(resp.body);
    print('$decodedData');

    return true;

  }
}