import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/screens/screens.dart';
import 'package:bines_app/services/data_guias_day_services.dart';
import 'package:bines_app/services/services.dart';
import 'package:bines_app/themes/app_themes.dart';

/* import 'package:bines_app/screens/search_guias_delegate.dart';
import 'package:bines_app/services/services.dart'; */
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExitPlantListScreen extends StatelessWidget {
  const ExitPlantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listaGuiasServices = Provider.of<DataGuiasDayServices>(context);
    const String cedula = '1234567890';
    const String tipo = 'GUIAPESCAD'; //Obtener Guias del Día
    final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context);
    listaGuiasAsignadas.cargarGrAsignadas(cedula, tipo);

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Salida de Planta'),
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
                // TODO Aqui navego a la pantalla de Productos
                onTap: () {
                  /* productsServices.selectedProduct =
                      productsServices.productos[indice].copy();
                  Navigator.pushNamed(context, 'product'); */
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
                  //product: productsServices.productos[indice],
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
              'Registro Guía Salida Planta ',
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
                    Provider.of<DataGuiaBinServices>(context, listen: false)
                        .insertGuiaProcesada(
                            nroguia, 'RGUIAPESCA', tipo, cedula);

                    /*  listaGuiasServices.insertBinGuias(listaBinGuiaAsignada);
                    if (listaGuiasServices.isLoading) {
                      const LoadingScreen();
                    }
                    listaBinGuiaAsignada.cargarBinAsignadas(
                        listaGuiasAsignadas.guiaSeleccionada.nroguia); */

                    /* listaBinGuiaAsignada.cargarBinAsignadas(
                        listaGuiasAsignadas.guiaSeleccionada.nroguia); */
                    /* listaGuiasServices.cargarBinAsignadasServ(
                        listaGuiasAsignadas.guiaSeleccionada.nroguia); */

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
              'Registro Guía Salida Planta ',
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
