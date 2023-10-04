import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({Key? key, required this.titulo, required this.texto})
      : super(key: key);
  final String titulo;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      /* backgroundColor: Colors.grey.shade200, */
      title: Text(
        titulo,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primary),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            texto,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
      //se agrega para hacer que presione un boton
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary),
            )),
        /* TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.second),
            )) */
      ],
    );
  }
}
