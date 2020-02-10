
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:happy/src/blocs/provider.dart';
import 'package:happy/src/pages/evaluacion_page.dart';
// import 'package:happy/src/pages/gracias_page.dart';
import 'package:happy/src/pages/home_alternativo.dart';
// import 'package:happy/src/pages/home_page.dart';
import 'package:happy/src/pages/login_page.dart';
import 'package:happy/src/pages/splash_page.dart';

import 'src/models/global.dart';

  void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
    //   statusBarColor: Colors.transparent
    // )); 

    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy!',
      initialRoute: 'home',
      routes: {
        // 'basico' : (BuildContext context) => BasicoPage(), 
        'login' : (BuildContext context) => LoginPage(), 
        // 'home' : (BuildContext context) => HomePage(), 
        'home' : (BuildContext context) => HomeAlternativo(), 
        'evaluar' : (BuildContext context) => EvaluacionPage(), 
        'gracias' : (BuildContext context) => GraciasPage(), 
      },
      theme: ThemeData(
        primaryColor: lightGreen,
        
      ),
    ),
    );
  }
}
