import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignedListBin extends StatelessWidget {
  /* const AssignedCardHeader({Key? key, required this.listaGuiasAsignadas})
      : super(key: key);
  final AssiggrListProvider listaGuiasAsignadas; */
  const AssignedListBin({Key? key, required this.listaGuiasBinAsignadas})
      : super(key: key);
  final BinGrAsignado listaGuiasBinAsignadas;
  @override
  Widget build(BuildContext context) {
    /* final listaGuiaBin = Provider.of<AssiggrListProvider>(context); */
    return Expanded(
        child: ListView.builder(
            itemCount: listaGuiasBinAsignadas.binAsignados.length,
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
                        'BIN # ${listaGuiasBinAsignadas.binAsignados[indice].nrobin}',
                        /* 'BIN # 16', */
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          listaGuiasBinAsignadas.binAsignados[indice].fechahora
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
                                listaGuiasBinAsignadas.binAsignados[indice]
                                            .sincronizado ==
                                        1
                                    ? Icons.cloud_done
                                    : Icons.cloud_off,
                                /* available == 1 ? Icons.cloud_done : Icons.cloud_off, */
                                color: listaGuiasBinAsignadas
                                            .binAsignados[indice]
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
                                if (listaGuiasBinAsignadas
                                        .binAsignados[indice].sincronizado ==
                                    0) {
                                  _showDialogConfirmation(
                                      context, listaGuiasBinAsignadas, indice);
                                } else {
                                  _showDialogVisualization(
                                      context, listaGuiasBinAsignadas, indice);
                                }
                              },
                              icon: Icon(
                                Icons.delete,
                                color: listaGuiasBinAsignadas
                                            .binAsignados[indice]
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
}
