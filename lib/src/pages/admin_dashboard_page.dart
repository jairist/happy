import 'package:flutter/material.dart';
import 'package:happy/src/provider/api_services.dart';
import 'package:happy/src/utils/utils.dart';
import 'package:happy/src/widgets/table_card.dart';
import 'package:happy/src/widgets/tickets_cards.dart';

class AdminDashboardPage extends StatefulWidget {
  AdminDashboardPage({Key key}) : super(key: key);

  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  bool loading = false;
  
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Column(
                children: <Widget>[
                  MediaQuery.of(context).size.width < 1300
                      ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          tickets(colors[0], context, Icons.format_list_bulleted, randomNumbers[1], "Proveedores" ),
                          tickets(colors[1], context, Icons.sentiment_very_satisfied, randomNumbers[2], "Servicios" ),
                          tickets(colors[2], context, Icons.spellcheck, randomNumbers[3], "Evaluaciones" ),
                          tickets(colors[3], context, Icons.comment, randomNumbers[3], "Comentarios" ),
                          
                        ],
                        )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          tickets(colors[0], context, Icons.format_list_bulleted, randomNumbers[1], "Proveedores" ),
                          tickets(colors[1], context, Icons.sentiment_very_satisfied, randomNumbers[2], "Servicios" ),
                          tickets(colors[2], context, Icons.spellcheck, randomNumbers[3], "Evaluaciones" ),
                          tickets(colors[3], context, Icons.comment, randomNumbers[3], "Comentarios" ),    
                        ]),
                  SizedBox(
                    height: 15,
                  ),
                  //colocar tabla aqui cuando este lista. 
                  
                      
                ],
              ),
            ),
          ]),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 1300 ? 4 : 3,
            childAspectRatio:
                MediaQuery.of(context).size.width < 1300 ? 0.6 : 0.65,
            mainAxisSpacing: 10,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 2,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://placeimg.com/640/480/nature/grayscale',
                          fit: BoxFit.fill,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Beautiful Nature",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '''The place is close to Metro Station and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Milan.''',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "800/night",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'HelveticaNeue',
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on),
                                        Text(
                                          "Milan, Italy",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'HelveticaNeue',
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              );
            },
            childCount: 4,
          ),
        )
      ],
    );
  }
}