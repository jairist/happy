import 'package:flutter/material.dart';
import 'package:happy/src/models/global.dart';
import 'package:happy/src/models/job.dart';

void main() => runApp(HomeAlternativo());


class HomeAlternativo extends StatefulWidget {

  @override
  _HomeAlternativo createState() => _HomeAlternativo();
}

class _HomeAlternativo extends State<HomeAlternativo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(  
              children: <Widget>[
                Column(             
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      _crearTitulo(),
                      Container(
                        height: 500,
                        margin: EdgeInsets.only(top: 200.0, bottom: 10.0),
                        padding: EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: _getServiceBox(),
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

  Widget _crearTitulo(){
    return  Container(
              padding: EdgeInsets.all(40),
              constraints: BoxConstraints.expand(height: 200),
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [lightBlueIsh, lightGreen],
                  begin: const FractionalOffset(1.0, 1.0),
                  end: const FractionalOffset(0.2, 0.2),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight:  Radius.circular(30))
              ),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Selecciona el servicio a evaluar', style: titleStyleWhite,)
                  ],
                ),
              ),
            );
  }
  List<String> services = ["Comida", "Transporte", "Salud", "Educacion", "Finance"];

  Map servicioToIcon = {
    "Comida" : Icon(Icons.fastfood, color: lightBlueIsh, size: 50,),
    "Transporte" : Icon(Icons.directions_car, color: lightBlueIsh, size: 50),
    "Salud" : Icon(Icons.healing, color: lightBlueIsh, size: 50),
    "Educacion" : Icon(Icons.book, color: lightBlueIsh, size: 50),
    "Finance" : Icon(Icons.card_membership, color: lightBlueIsh, size: 50),
  };

  Widget _getServiceContainer(String categoryName) {
    return new Container(
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
          height: 180,
          width: 140,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Text(categoryName, style: titileStyleLighterBlack),
              Container(
                padding: EdgeInsets.only(top: 30),
                height: 100,
                width: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  child:  servicioToIcon[categoryName],
                  elevation: 20,
                  onPressed: () {
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
        i ++;
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