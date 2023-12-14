//import 'dart:ffi';

import 'package:bines_app/models/models.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
//import 'package:productos_app/models/models.dart';

class AssigmentBinCard extends StatelessWidget {
  const AssigmentBinCard({Key? key, required this.asignados}) : super(key: key);
  final AssiggrModel asignados;

  //const AssigmentBinCard({Key? key}) : super(key: key);
  //final Product product;
  //final bool sincronizado = true;
  final double tamanio = 11;
  final double tamanioTitulo = 12;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 15),
        width: double.infinity,
        height: 110,
        decoration: _cardBorders(),
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            /* const Icon(Icons.app_registration,
                size: 25, color: AppTheme.primary), */
            Expanded(
              //flex: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#Guìa :',
                      style: TextStyle(
                          fontSize: tamanioTitulo,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    /* Text(
                      'Prov. :',
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ), */
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      'KG',
                      style: TextStyle(
                          fontSize: tamanioTitulo,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      'Placa :',
                      style: TextStyle(
                          fontSize: tamanioTitulo,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    /* const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      'Placa :',
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ), */
                  ],
                ),
              ),
            ),
            Expanded(
              //flex: 0,
              child: Container(
                //color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asignados.nroguia,
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    /* Text(
                      'NIRSA DEL ECU',
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ), */
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      asignados.kg.toString(),
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      asignados.placa.toString(),
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              //flex: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fecha :',
                      style: TextStyle(
                          fontSize: tamanioTitulo,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      '# Pisc :',
                      style: TextStyle(
                          fontSize: tamanioTitulo,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      'F/H Reg :',
                      style: TextStyle(
                          fontSize: tamanioTitulo,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              //flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asignados.fecha.toString(),
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      asignados.piscina,
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      asignados.fechahorareg,
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            if (asignados.sincronizado == 1)
              const Icon(Icons.cloud_done, size: 25, color: AppTheme.upload),
            if (asignados.sincronizado == 0)
              const Icon(Icons.cloud_upload, size: 25, color: AppTheme.second),
            const Padding(padding: EdgeInsets.only(right: 10)),
            if (asignados.activo == 1) //activo
              const Icon(Icons.edit_calendar_rounded,
                  size: 25, color: AppTheme.grisoscuro),
            if (asignados.activo == 0) //inactivo
              const Icon(Icons.visibility,
                  size: 25, color: AppTheme.grisoscuro),
            const Padding(padding: EdgeInsets.only(right: 10)),
            /* _ProductsDetails(
                tittle: 'tittle', subtittle: 'subtittle', price: 12.0) */
            /* Column(
              children: const [
                _ProductsDetails(
                    tittle: 'tittle', subtittle: 'subtittle', price: 12.0)
              ],
            ) */
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10)
          ]);
}
