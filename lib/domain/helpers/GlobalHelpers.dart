import 'package:flutter/material.dart';

String formatDate(DateTime dateTime) {
  // Formatear la fecha según tus necesidades, por ejemplo: "yyyy-MM-dd"
  return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
}

void showDialog2(BuildContext context, String rainProbability) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Probabilidad de Lluvia'),
        content: Text('La probabilidad de lluvia es: ${(rainProbability)}%'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Aceptar'),
          ),
        ],
      );
    },
  );
}
