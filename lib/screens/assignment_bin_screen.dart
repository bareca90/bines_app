import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/screens/screens.dart';
import 'package:bines_app/services/services.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssigmentBinScreen extends StatelessWidget {
  const AssigmentBinScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context);
    final listaBinGuiaAsignada = Provider.of<BinGrAsignado>(context);

    /* final nroguia = listaGuiasAsignadas.guiaSeleccionada.nroguia; */
    /* listaBinGuiaAsignada.cargarBinAsignadas(nroguia); */

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bines por Guìa'),
        //agregar boton para logout
        actions: [
          IconButton(
              onPressed: () {
                _showDialogDeleteAllBines(
                    context, listaGuiasAsignadas, listaBinGuiaAsignada);
                listaBinGuiaAsignada.catidadBinesEscaneados(
                    listaGuiasAsignadas.guiaSeleccionada.nroguia);
              },
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                //TODO: Se procdera a ejecutar el WebServices para subir los escaneados

                //aqui se debe controlar quitar la
                //authServices.logout();
                //Navigator.pushReplacementNamed(context, 'login');

                //Aqui va a ir el consumo de las apis de SIPE
                _showDialogInsertBines(
                  context,
                  listaGuiasAsignadas,
                  listaBinGuiaAsignada,
                );
                listaBinGuiaAsignada.cargarBinAsignadas(
                    listaGuiasAsignadas.guiaSeleccionada.nroguia);
                listaBinGuiaAsignada.catidadBinesEscaneados(
                    listaGuiasAsignadas.guiaSeleccionada.nroguia);
                /* listaGuiasServices.cargarBinAsignadasServ(
                    listaGuiasAsignadas.guiaSeleccionada.nroguia); */
                /* listaBinGuiaAsignada.cargarBinAsignadas(
                    listaGuiasAsignadas.guiaSeleccionada.nroguia); */
                /* listaGuiasServices.cargarBinAsignadasServ(
                    listaGuiasAsignadas.guiaSeleccionada.nroguia); */
              },
              icon: const Icon(Icons.cloud_upload_rounded)),
          IconButton(
              onPressed: () {
                //TODO: Se procdera a Inactivar la guia

                _showDialogProcesaGuia(
                  context,
                  listaGuiasAsignadas,
                  listaBinGuiaAsignada,
                );
                //aqui se debe controlar quitar la
                //authServices.logout();
                //Navigator.pushReplacementNamed(context, 'login');

                //Aqui va a ir el consumo de las apis de SIPE
              },
              icon: const Icon(Icons.lock))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            color: AppTheme.primary,
            height: 120,
            child: AssignedCardHeader(listaGuiasAsignadas: listaGuiasAsignadas),
          ),
          /* AssignedListBin(
                nroguia: listaGuiasAsignadas.guiaSeleccionada.nroguia) */
          /* _listaBinesGuiasAsignados(listaBinGuiaAsignada, context) */
          AssignedListBin(listaGuiasBinAsignadas: listaBinGuiaAsignada)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: listaGuiasAsignadas.guiaSeleccionada.activo == 1
          ? ScanButtonQR(listaGuiasAsignadas: listaGuiasAsignadas)
          : Container() /* Text(SnackBarNotifications.showSnackBar(
              'Esta Guìa ya Salìo de Planta ')) */
      /* const Alert(
              titulo: 'Registo Bin - Guìa',
              texto:
                  'No se Puede Escanear Bines por que la guìa salio de Planta') */
      ,
    );
  }

  Future<dynamic> _showDialogProcesaGuia(
      BuildContext context,
      AssiggrListProvider listaGuiasAsignadas,
      BinGrAsignado listaBinGuiaAsignada) {
    /* final listaGuiasServices =
        Provider.of<DataGuiaBinServices>(context, listen: false); */
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              'Registro Bin en Guìa ',
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
                  'Desea Procesar la Guía # ${listaGuiasAsignadas.guiaSeleccionada.nroguia} ?',
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
                            listaGuiasAsignadas.guiaSeleccionada.nroguia,
                            'PBG');
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

  Future<dynamic> _showDialogInsertBines(
      BuildContext context,
      AssiggrListProvider listaGuiasAsignadas,
      BinGrAsignado listaBinGuiaAsignada) {
    /* final listaGuiasServices =
        Provider.of<DataGuiaBinServices>(context, listen: false); */
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              'Registro Bin en Guìa ',
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
                  'Desea Sincronizar los Bines Escaneados en la Guía # ${listaGuiasAsignadas.guiaSeleccionada.nroguia} ?',
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
                        .insertBinGuias(listaBinGuiaAsignada);
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

  Future<dynamic> _showDialogDeleteAllBines(
      BuildContext context,
      AssiggrListProvider listaGuiasAsignadas,
      BinGrAsignado listaBinGuiaAsignada) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              'Registro Bin en Guìa ',
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
                  'Desea Eliminar todos los Bines No Sincronizados de Guìa # ${listaGuiasAsignadas.guiaSeleccionada.nroguia} ?',
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
                    Provider.of<BinGrAsignado>(context, listen: false)
                        .borrarBinesGuia(
                            listaGuiasAsignadas.guiaSeleccionada.nroguia);
                    listaBinGuiaAsignada.cargarBinAsignadas(
                        listaGuiasAsignadas.guiaSeleccionada.nroguia);
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

  Expanded _listaBinesGuiasAsignados(
      BinGrAsignado listaBinGuiaAsignada, BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: listaBinGuiaAsignada.binAsignados.length,
            itemBuilder: (_, indice) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: ListTile(
                      leading: const Icon(
                        Icons.assignment,
                        color: AppTheme.primary,
                        size: 30,
                      ),
                      title: Text(
                        'BIN # ${listaBinGuiaAsignada.binAsignados[indice].nrobin}',
                        /* 'BIN # 16', */
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          listaBinGuiaAsignada.binAsignados[indice].fechahora
                              .toString(),
                          /* '#Guia 145', */
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /*Icon Button para el cloud*/
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                //Aqui averiguamos el tipo que nos llega y en base a eso mostramos el icono, ya sea del mapa o de las direcciones
                                listaBinGuiaAsignada.binAsignados[indice]
                                            .sincronizado ==
                                        1
                                    ? Icons.cloud_done
                                    : Icons.cloud_off,
                                /* available == 1 ? Icons.cloud_done : Icons.cloud_off, */
                                color: listaBinGuiaAsignada.binAsignados[indice]
                                            .sincronizado ==
                                        1
                                    ? AppTheme.upload
                                    : AppTheme.second,
                                /* color: available == 1 ? AppTheme.upload : AppTheme.second, */
                                size: 30,
                              )),
                          /*Icon Button para eliminacion */
                          IconButton(
                              onPressed: () {
                                if (listaBinGuiaAsignada
                                        .binAsignados[indice].sincronizado ==
                                    0) {
                                  _showDialogConfirmation(
                                      context, listaBinGuiaAsignada, indice);
                                } else {
                                  _showDialogVisualization(
                                      context, listaBinGuiaAsignada, indice);
                                }
                              },
                              icon: Icon(
                                Icons.delete,
                                color: listaBinGuiaAsignada.binAsignados[indice]
                                            .sincronizado ==
                                        1
                                    ? AppTheme.grisoscuro
                                    : AppTheme.primary,
                                /* color: available == 1 ? AppTheme.upload : AppTheme.second, */
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                  ),
                )));
  }

  Future<dynamic> _showDialogConfirmation(
      BuildContext context, BinGrAsignado listaBinGuiaAsignada, int indice) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              'Registro Bin en Guìa ',
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
                  'Desea Eliminar el Bin # ${listaBinGuiaAsignada.binAsignados[indice].nrobin} de la Guìa # ${listaBinGuiaAsignada.binAsignados[indice].nroguia} ?',
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
                    Provider.of<BinGrAsignado>(context, listen: false)
                        .borrarBinGuia(
                            listaBinGuiaAsignada.binAsignados[indice].nroguia,
                            listaBinGuiaAsignada.binAsignados[indice].nrobin);
                    listaBinGuiaAsignada.cargarBinAsignadas(
                        listaBinGuiaAsignada.binAsignados[indice].nroguia);
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

  Future<dynamic> _showDialogVisualization(
      BuildContext context, BinGrAsignado listaBinGuiaAsignada, int indice) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              'Registro Bin en Guìa ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'No se puede Eliminar este bin, ya fue sincronizado !!',
                  style: TextStyle(
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

  /* BoxDecoration _cardBorders() => BoxDecoration(
          color: AppTheme.second,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10)
          ]); */
}
