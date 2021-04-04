import 'dart:math';

import 'package:flutter/material.dart';
import 'package:happy/src/blocs/provider.dart';
import 'package:happy/src/models/global.dart';
import 'package:happy/src/preferencias_usuario/preferencias_usuario.dart';

import '../models/global.dart';

void main() => runApp(HomeAlternativo());

class HomeAlternativo extends StatefulWidget {
  @override
  _HomeAlternativo createState() => _HomeAlternativo();
}

class _HomeAlternativo extends State<HomeAlternativo> {
  final _prefs = new PreferenciasUsuario();
  bool _isButtonDisabled;

  @override
  void initState() {
    // TODO: implement initState
    _isButtonDisabled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    _crearTitulo(bloc),
                    Container(
                      height: 600,
                      margin: EdgeInsets.only(top: 200.0, bottom: 10.0),
                      padding: EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              // height:  size.height * 0.6,
                              child: ListView(
                                shrinkWrap: true,
                                children: _getServiceBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _verificarCategoriaActiva() {}

  Widget _crearTitulo(LoginBloc bloc) {
    final size = MediaQuery.of(context).size;
    final randomNumber = Random();

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.09)),
    );

    final fondo = Container(
        padding: EdgeInsets.all(30),
        constraints: BoxConstraints.expand(height: 200),
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [lightBlueIsh, lightGreen],
                begin: const FractionalOffset(1.0, 1.0),
                end: const FractionalOffset(0.2, 0.2),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))));
    final titulo = Container(
      padding: EdgeInsets.only(top: 40.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bienvenido!!',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 35.00),
          ),
          SizedBox(height: 10),
          Text(
            'Selecciona el servicio a evaluar',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 30.00),
          )
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(
          top: randomNumber.nextInt(10).toDouble(),
          left: randomNumber.nextInt(40).toDouble(),
          child: circulo,
        ),
        Positioned(
          top: randomNumber.nextInt(15).toDouble(),
          left: randomNumber.nextInt(40).toDouble(),
          child: circulo,
        ),
        Positioned(
          top: randomNumber.nextInt(80).toDouble(),
          right: randomNumber.nextInt(120).toDouble(),
          child: circulo,
        ),
        Positioned(
          bottom: randomNumber.nextInt(10).toDouble(),
          right: randomNumber.nextInt(120).toDouble(),
          child: circulo,
        ),
        Positioned(
          bottom: randomNumber.nextInt(110).toDouble(),
          right: -randomNumber.nextInt(120).toDouble(),
          child: circulo,
        ),
        titulo
      ],
    );
  }

  List<String> services = [
    "PedidosYa",
    "Subsidio en Fripick",
    "Creditos en Farmacias",
    "Combustible",
    "Club de precio",
    "Bonos de supermercados"
  ];

  Map servicioToIcon = {
    "PedidosYa": Icon(
      Icons.fastfood,
      color: lightBlueIsh,
      size: 50,
    ),
    "Subsidio en Fripick":
        Icon(Icons.directions_car, color: lightBlueIsh, size: 50),
    "Creditos en Farmacias": Icon(Icons.healing, color: lightBlueIsh, size: 50),
    "Combustible": Icon(Icons.local_gas_station, color: lightBlueIsh, size: 50),
    "Club de precio":
        Icon(Icons.insert_emoticon, color: lightBlueIsh, size: 50),
    "Bonos de supermercados":
        Icon(Icons.store_mall_directory, color: lightBlueIsh, size: 50),
  };

  Widget _getServiceContainer(String categoryName) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            categoryName,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 80,
            child: FloatingActionButton(
              heroTag: categoryName,
              backgroundColor: Colors.white,
              child: servicioToIcon[categoryName],
              elevation: 20,
              onPressed: _isButtonDisabled
                  ? null
                  : () {
                      Navigator.of(context)
                          .pushNamed('evaluar', arguments: categoryName);
                      // Navigator.pushNamed(context, 'detalle', arguments: pelicula );
                      print('Se presiono sobre $categoryName');
                    },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getServiceBox() {
    List<Widget> servicesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in services) {
      if (i < 2) {
        rows.add(_getServiceContainer(category));
        i++;
      } else {
        i = 0;
        servicesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(_getServiceContainer(category));
        i++;
      }
    }
    if (rows.length > 0) {
      servicesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return servicesCards;
  }
}
