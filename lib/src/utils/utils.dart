import 'package:flutter/material.dart';

bool isNumeric(String s){
  if(s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null ) ? false : true;

}

void mostrarAlerta(BuildContext context, String mensaje){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Informacion incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: ()=> Navigator.of(context).pop()),
        ],
      );
    }
  );

}
List<MaterialColor> colors = [
  Colors.pink,
  Colors.amber,
  Colors.teal,
  Colors.lightBlue,
];
List<String> newTexts = [
  "Proveedores!",
  "Servicios!",
  "Evaluaciones!",
  "Detalles!"
];
List<String> randomNumbers = ["13", "12", "124", "13", "14"];
List<IconData> icons = [
  Icons.room_service,
  Icons.track_changes,
  Icons.sentiment_very_satisfied,
  Icons.question_answer,
  Icons.add
];
List<String> elementsName = [
  "Hydrogen",
  "Helium",
  "Lithium",
  "Beryllium",
  "Boron",
  "Carbon",
  "Nitrogen"
];
List<String> elementsWeights = [
  "1.0079",
  "4.0026",
  "6.941",
  "9.0122",
  "10.811",
  "12.0107",
  "14.0067"
];
List<String> elementsSymbol = ["H", "He", "Li", "Be", "B", "C", "N"];
List<String> quotes = [
  "I did you a big favor. I have successfully privatized world peace. What more do you want?",
  "Following’s not really my style.",
  "Jarvis, sometimes you gotta run before you can walk.",
  "Okay, give me smooch for good luck, I might not make it back.",
  "I told you, I don’t want to join your super secret boy band.",
  "I am Iron Man.",
  "My name is Tony Stark and I’m not afraid of you. I know you’re a coward, so I decided… that you just died, pal. I’m gonna come get the body. There’s no politics here, it’s just good old-fashioned revenge.",
];