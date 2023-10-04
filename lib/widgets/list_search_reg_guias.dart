//import 'dart:ffi';

import 'package:bines_app/models/models.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
//import 'package:productos_app/models/models.dart';

class ListSearchGuiasReg extends StatelessWidget {
  const ListSearchGuiasReg({Key? key, required this.asignados})
      : super(key: key);
  final RegisteredGuias asignados;

  final double tamanio = 15;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        width: double.infinity,
        height: 56,
        decoration: _cardBorders(),
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            const Icon(Icons.list_alt_rounded,
                size: 25, color: AppTheme.primary),
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
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    /* const Divider(
                      height: 5,
                      color: Colors.white,
                    ), */
                    /* Text(
                      'KG',
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ), */
                    /* const Divider(
                      height: 5,
                      color: Colors.white,
                    ), */
                    Text(
                      'Fecha :',
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
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
                    /* const Divider(
                      height: 5,
                      color: Colors.white,
                    ), */
                    /* Text(
                      asignados.kg.toString(),
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ), */
                    /* const Divider(
                      height: 5,
                      color: Colors.white,
                    ), */
                    Text(
                      asignados.fechaguia.toString(),
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            /*  Expanded(
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
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    /* Text(
                      '# Pisc :',
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ), */
                  ],
                ),
              ),
            ), */
            /*  Expanded(
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
                    /* Text(
                      asignados.piscina,
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ), */
                  ],
                ),
              ),
            ), */
            const Icon(Icons.arrow_forward_ios_outlined,
                size: 20, color: AppTheme.second),
            /* if (asignados.sincronizado == 1)
              const Icon(Icons.cloud_done, size: 30, color: AppTheme.upload),
            if (asignados.sincronizado == 0)
              const Icon(Icons.cloud_upload, size: 30, color: AppTheme.second), */
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
        borderRadius: BorderRadius.circular(5),
        /* boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10)
          ] */
      );
}
