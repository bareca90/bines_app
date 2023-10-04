import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignedCardHeader extends StatelessWidget {
  const AssignedCardHeader({Key? key, required this.listaGuiasAsignadas})
      : super(key: key);
  final AssiggrListProvider listaGuiasAsignadas;
  final double tamanio = 12.5;
  @override
  Widget build(BuildContext context) {
    final listaGuiasBinAsignadas =
        Provider.of<BinGrAsignado>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              //color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#Guìa : ',
                    style: TextStyle(
                        fontSize: tamanio,
                        color: AppTheme.second,
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
                    'Kg :',
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
                    'Cant. : ',
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
            flex: 1,
            child: Container(
              //color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listaGuiasAsignadas.guiaSeleccionada.nroguia,
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
                    listaGuiasAsignadas.guiaSeleccionada.kg.toString(),
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
                    /* listaGuiasAsignadas.guiaSeleccionada.cant.toString(), */
                    listaGuiasBinAsignadas.cantescaneados.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.upload,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              //color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fecha : ',
                    style: TextStyle(
                        fontSize: tamanio,
                        color: AppTheme.second,
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
            flex: 1,
            child: Container(
              //color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listaGuiasAsignadas.guiaSeleccionada.fecha,
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
                    listaGuiasAsignadas.guiaSeleccionada.piscina,
                    style: TextStyle(
                        fontSize: tamanio,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
