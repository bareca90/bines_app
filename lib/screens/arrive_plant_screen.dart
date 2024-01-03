import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/screens/screens.dart';
import 'package:bines_app/services/services.dart';
import 'package:bines_app/themes/app_themes.dart';

/* import 'package:bines_app/screens/search_guias_delegate.dart';
import 'package:bines_app/services/services.dart'; */
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LlegadaPlantaCMP extends StatelessWidget {
  const LlegadaPlantaCMP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String cedula = '1234567890';
    const String tipo = 'GUIALLEGPL'; //Obtener Guías Llegadas a Camaroneras

    final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context);
    listaGuiasAsignadas.cargarGrAsignadas(cedula, tipo);

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Llegada Planta'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: SearchGuiasDelegate(
                          listaGuiasAsignadas: listaGuiasAsignadas));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: ListView.builder(
            //itemCount: productsServices.productos.length,
            itemCount: listaGuiasAsignadas.asignados.length,
            itemBuilder: (BuildContext context, int indice) => GestureDetector(
                onTap: () {
                  listaGuiasAsignadas.guiaSeleccionada =
                      listaGuiasAsignadas.asignados[indice].copy();

                  final nroguia = listaGuiasAsignadas.asignados[indice].nroguia;
                  if (listaGuiasAsignadas.asignados[indice].activo == 1) {
                    _showDialogInsertBines(
                      context,
                      nroguia,
                      tipo,
                      cedula,
                    );
                  } else {
                    _showDialogMsg(context,
                        'Lo Sentimos la Guía Seleccionada ya posee Registro de fecha y hora ');
                  }
                },
                child: AssigmentBinCard(
                  asignados: listaGuiasAsignadas.asignados[indice],
                ))),
      ),
    );
  }

  Future<dynamic> _showDialogInsertBines(
      BuildContext context, String nroguia, String tipo, String cedula) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              'Registro Móvil Listo ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Desea Registrar Fec/Hora Guía # $nroguia ?',
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
                    //Modificar para que sea el estado Registro de Llegada Granja
                    Provider.of<DataGuiaBinServices>(context, listen: false)
                        .insertGuiaProcesada(
                            nroguia, 'RGUIALLEGP', tipo, cedula);

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primary),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.second),
                  ))
            ],
          );
        });
  }

  Future<dynamic> _showDialogMsg(BuildContext context, String mensaje) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              'Registro Móvil Listo ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mensaje,
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
            ],
          );
        });
  }
}
