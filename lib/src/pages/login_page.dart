import 'dart:math';

import 'package:flutter/material.dart';
import 'package:happy/src/blocs/login_bloc.dart';
import 'package:happy/src/blocs/provider.dart';
 
// void main() => runApp(LoginPage());
 
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _creaFondo(context),
            _loginForm(context)

          ]
          ),
      );
  }

  Widget _loginForm(BuildContext context){
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;



    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0, ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text ('Ingreso',style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 20.0,),
                _crearEmail(bloc),
                SizedBox(height: 10.0,),
                _crearPassword(bloc),
                SizedBox(height: 30.0,),
                _crearBoton(bloc)
              ],
            ),
          )
          ,
          Text('Olvidó la consaseña? ')
        
        ],
      ),
    );

  }

  Widget _crearEmail(LoginBloc bloc){

    return  StreamBuilder(

      stream: bloc.emailStream,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Colors.lightBlueAccent,),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),
      );  
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.passwordStream ,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            // keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.lightBlueAccent,),
              // hintText: 'ejemplo@correo.com',
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
          
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc){

    return  StreamBuilder(
      stream: bloc.formValidStream,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snapshot){ 
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
            child: Text('Ingresar'),

          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.black26),
          ),
          elevation: 0.5,
          color: Colors.lightBlueAccent,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? (){
    
              print('===============');
              print('Email    : ${bloc.email}');
              print('Password : ${bloc.password}');
              print('===============');
    
            Navigator.pushNamed(context, 'home');
          } : null
        );
      },
    );
  }

  Widget _creaFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final randomNumber = Random();

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
            
            // Color.fromRGBO(63, 63, 156, 1.0),
            // Color.fromRGBO(90, 70, 178, 1.0)

          ]
        )
      ),

    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.09)
      ),
    );
    
    final nombreUsuario = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(children: <Widget>[
        Icon(Icons.sentiment_very_satisfied, color: Colors.white, size: 80.0,),
        SizedBox(height: 10.0, width: double.infinity,),
        Text('Jairis Rosario', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),)
      ],),
    );
    
    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned( top: randomNumber.nextInt(10).toDouble(), left: randomNumber.nextInt(40).toDouble(), child: circulo,),
        Positioned( top: randomNumber.nextInt(80).toDouble(), right: randomNumber.nextInt(120).toDouble(), child: circulo,),
        // Positioned( top: randomNumber.nextInt(30).toDouble(), left: -randomNumber.nextInt(50).toDouble(), child: circulo,),
        Positioned( bottom: randomNumber.nextInt(10).toDouble(), right: randomNumber.nextInt(120).toDouble(), child: circulo,),
        Positioned( bottom: randomNumber.nextInt(110).toDouble(), right: -randomNumber.nextInt(120).toDouble(), child: circulo,),
        Positioned( top: randomNumber.nextInt(90).toDouble(), left: randomNumber.nextInt(120).toDouble(), child: circulo,),
        Positioned( bottom: randomNumber.nextInt(120).toDouble(), left: randomNumber.nextInt(120).toDouble(), child: circulo,),

        nombreUsuario
      ],
    );

  }
}