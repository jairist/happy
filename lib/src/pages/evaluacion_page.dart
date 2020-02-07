import 'package:flutter/material.dart';
import 'package:happy/src/widgets/header.dart';
 
void main() => runApp(EvaluacionPage());
 
class EvaluacionPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final String servicio = ModalRoute.of(context).settings.arguments;
    return Scaffold(
         body: Stack(
           children: <Widget>[
             _crearFondo(servicio),
           ],
         )
    );
  }

  Widget _crearFondo(String servicio) { 
    return HeaderPage(servicio: servicio);
  }
}