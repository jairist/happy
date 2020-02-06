import 'package:flutter/material.dart';
 
void main() => runApp(EvaluacionPage());
 
class EvaluacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

         body: Stack(
           children: <Widget>[
             _crearFondo(),
           ],
         )
    );
  }

  Widget _crearFondo() {
    final gradiente  = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [ 
            

            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
            // Color.fromRGBO(000, 000, 000, 1.0),
            // Color.fromRGBO(000, 000, 000, 1.0),
          ]
        )
      ),
    );
    return gradiente;

  }

  // Widget _crearAPPBar() {

  // }
}