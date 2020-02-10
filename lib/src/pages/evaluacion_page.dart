import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:happy/src/models/evaluacion_model.dart';
import 'package:happy/src/models/global.dart';
import 'package:happy/src/provider/evaluacion_provider.dart';
import 'package:happy/src/widgets/header.dart';
import 'package:happy/src/widgets/star_display_widget.dart';
 
void main() => runApp(EvaluacionPage());
 
class EvaluacionPage extends StatefulWidget {
  @override
  _EvaluacionPageState createState() => _EvaluacionPageState();
}

class _EvaluacionPageState extends State<EvaluacionPage> {

  final _formKey = GlobalKey<FormState>();
  final  evaluacionProvider = new EvaluacionProvider();

  EvaluacionModelo evaluacion = new EvaluacionModelo();

  @override
  Widget build(BuildContext context) {
    final String servicio = ModalRoute.of(context).settings.arguments;
    evaluacion.servicio = servicio;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Gradient(colors: [lightBlueIsh, lightGreen]),
        flexibleSpace: Container(
          decoration: BoxDecoration( gradient: LinearGradient(colors:  [lightBlueIsh, lightGreen])),
        ),
        automaticallyImplyLeading: true,
        title: Text('$servicio', style: TextStyle(color: Colors.white)),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.photo_size_select_actual), 
          onPressed: (){}
          ),
          IconButton(icon: Icon(Icons.camera_alt), 
          onPressed: (){})
        ],
      ),
         body: SingleChildScrollView(
           child: Stack(
             children: <Widget>[
               Column(
                 children: <Widget>[
                   Stack(
                     children: <Widget>[
                   _crearFormularioEvaluacion(context, servicio),
                        // _crearFondo(servicio),
                     ],
                   ),
                   
                 ],
                 
               ),
               
             ],
             
           ),
         )
    );
  }

  Widget _crearFondo(String servicio) { 
    return HeaderPage(servicio: servicio);
  }

  Widget _crearFormularioEvaluacion(BuildContext context, String servicio) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
        children: <Widget>[
           _crearEstrellas(context, 3),
           _crearCampoDescripcion(servicio),
           _crearBoton(context)
           
              // Add TextFormFields and RaisedButton here.
        ]
        
      ),
    ),
    );
  }

  Widget _crearEstrellas(BuildContext context, int index ) {
    return RatingBar(
    initialRating: evaluacion.puntuacion,
    itemCount: 5,
    itemBuilder: (context, index) {
       switch (index) {
          case 0:
             return Icon(
                Icons.sentiment_very_dissatisfied,
                color: Colors.red,
             );
          case 1:
             return Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.redAccent,
             );
          case 2:
             return Icon(
                Icons.sentiment_neutral,
                color: Colors.amber,
             );
          case 3:
             return Icon(
                Icons.sentiment_satisfied,
                color: Colors.lightGreen,
             );
          case 4:
              return Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.green,
              );
       }
    },
    onRatingUpdate: (rating) {
      evaluacion.puntuacion = rating;
     
      print(rating);
    },
    ); 
  }

  Widget _crearCampoDescripcion(String servicio) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        initialValue: evaluacion.descripcion,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: 'Escriba un comentario',
          hintText: 'Compartanos algunos detalles sobre el servicio'
          
        ),

        onSaved: (value ) => evaluacion.descripcion = value,
        validator: (value) {
          if(value.length < 1){
            return 'Por favor ingrese una descripcion';
          }
          return null;
        },
        
        
      ),
    );
      
  }
   Widget _crearBoton(BuildContext context ) {
        return RaisedButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          // color: Colors.deepPurple,
          color: Colors.lightGreen,
          textColor: Colors.white,
          label: Text('Guardar'),
          icon: Icon(Icons.save_alt ),
          // textColor: Colors.white,
          onPressed: (){
            
            if(!_formKey.currentState.validate()) return;
          
            //ahora cambio el estado del formulario. 
            _formKey.currentState.save();
            print(evaluacion.descripcion);
            print(evaluacion.usuario);
            print(evaluacion.puntuacion);
            print(evaluacion.servicio);

            evaluacionProvider.crearEvaluacion(evaluacion);

            Navigator.of(context).pushNamed('gracias');
          },
          
          );
      }
}