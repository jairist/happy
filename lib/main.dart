
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:happy/src/blocs/provider.dart';
import 'package:happy/src/pages/evaluacion_page.dart';
// import 'package:happy/src/pages/gracias_page.dart';
import 'package:happy/src/pages/home_alternativo.dart';
// import 'package:happy/src/pages/home_page.dart';
import 'package:happy/src/pages/login_page.dart';
import 'package:happy/src/pages/regiter_page.dart';
import 'package:happy/src/pages/splash_page.dart';
import 'package:happy/src/preferencias_usuario/preferencias_usuario.dart';

import 'src/models/global.dart';

  Future<void> main() async { 

    WidgetsFlutterBinding.ensureInitialized();
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    
    runApp(MyApp());
  }
 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    
    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
    //   statusBarColor: Colors.transparent
    // )); 

    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy!',
      initialRoute: 'login',
      routes: {
        // 'basico' : (BuildContext context) => BasicoPage(), 
        'login'     : (BuildContext context) => LoginPage(), 
        'registro'  : (BuildContext context) => RegisterPage(), 
        'home'      : (BuildContext context) => HomeAlternativo(), 
        'evaluar'   : (BuildContext context) => EvaluacionPage(), 
        'gracias'   : (BuildContext context) => GraciasPage(), 
      },
      theme: ThemeData(
        primaryColor: lightGreen,
        
      ),
    ),
    );
  }
}
