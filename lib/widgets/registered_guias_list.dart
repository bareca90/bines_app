//import 'dart:ffi';

import 'package:bines_app/models/models.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
//import 'package:productos_app/models/models.dart';

class GuiasListReg extends StatelessWidget {
  const GuiasListReg({Key? key, required this.registradas}) : super(key: key);
  final RegisteredGuias registradas;

  //const AssigmentBinCard({Key? key}) : super(key: key);
  //final Product product;
  //final bool sincronizado = true;
  final double tamanio = 12;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 15),
        width: double.infinity,
        height: 80,
        decoration: _cardBorders(),
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            if (registradas.tipoproceso == 'RSP')
              const Icon(Icons.gite_sharp, size: 25, color: AppTheme.primary),
            if (registradas.tipoproceso == 'RLG')
              const Icon(Icons.location_on_rounded,
                  size: 25, color: AppTheme.primary),
            if (registradas.tipoproceso == 'RCB')
              const Icon(Icons.propane_tank, size: 25, color: AppTheme.primary),
            if (registradas.tipoproceso == 'RSG')
              const Icon(Icons.assignment_return_rounded,
                  size: 25, color: AppTheme.primary),
            if (registradas.tipoproceso == 'RLP')
              const Icon(Icons.factory, size: 25, color: AppTheme.primary),
            if (registradas.tipoproceso == 'RLR')
              const Icon(Icons.precision_manufacturing_sharp,
                  size: 25, color: AppTheme.primary),
            if (registradas.tipoproceso == 'RRR')
              const Icon(Icons.flip, size: 25, color: AppTheme.primary),
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
                          fontSize: tamanio,
                          color: AppTheme.second,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                    Text(
                      'Cant. :',
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
                      registradas.nroguia,
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
                      registradas.kg.toString(),
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
                      registradas.cantescaneada.toString(),
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
                          fontSize: tamanio,
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
                          fontSize: tamanio,
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
                      registradas.fechaguia.toString(),
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
                      registradas.piscina,
                      style: TextStyle(
                          fontSize: tamanio,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            if (registradas.sincronizado == 1)
              const Icon(Icons.cloud_done, size: 25, color: AppTheme.upload),
            if (registradas.sincronizado == 0)
              const Icon(Icons.cloud_upload, size: 25, color: AppTheme.second),
            const Padding(padding: EdgeInsets.only(right: 10)),
            if (registradas.activo == 1) //activo
              const Icon(Icons.edit_calendar_rounded,
                  size: 25, color: AppTheme.grisoscuro),
            if (registradas.activo == 0) //inactivo
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
        /* child: Stack(alignment: Alignment.bottomLeft, children: [
          //_BackgroundImage(product.picture),
          // const _BackgroundImage(null),
          const _ProductsDetails(
            //tittle: product.name,
            tittle: 'HC4525',
            //subtittle: product.id.toString(),
            subtittle: 'Subtitulo',
            //price: product.price,
            price: 0.00,
          ),
          const Positioned(
              top: 0,
              right: 0,
              child: _PriceTab(
                //price: product.price,
                price: 1.20,
              )),
          //Este se Mostrara de Manera Condicional
          //if (!product.available) //si no esta disponible
          if (variable) //si no esta disponible
            const Positioned(top: 0, left: 0, child: _Disponible())
        ]), */
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
