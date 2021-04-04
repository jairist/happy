import 'package:flutter/material.dart';
import 'package:happy/src/blocs/provider.dart';
import 'package:happy/src/pages/evaluacion_page.dart';
import 'package:happy/src/pages/home_alternativo.dart';
import 'package:happy/src/pages/login_page.dart';
import 'package:happy/src/pages/resetear_clave.dart';
import 'package:happy/src/pages/splash_crear_cuenta.dart';
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
    return buildProviderApp();
  }

  Provider buildProviderApp() {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Happy!',
        initialRoute: 'login',
        routes: {
          // 'basico' : (BuildContext context) => BasicoPage(),
          'login': (BuildContext context) => LoginPage(),
          'registro': (BuildContext context) => CrearCuentaSplashPage(),
          'home': (BuildContext context) => HomeAlternativo(),
          //'home'      : (BuildContext context) => HomeScreen(),
          'evaluar': (BuildContext context) => EvaluacionPage(),
          'resetear': (BuildContext context) => ResetearClave(),
          'gracias': (BuildContext context) => GraciasPage(),
        },
        theme: ThemeData(
          primaryColor: lightGreen,
          fontFamily: 'HelveticaNeue',
        ),
      ),
    );
  }
}
