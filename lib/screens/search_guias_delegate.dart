import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/services/services.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class SearchGuiasDelegate extends SearchDelegate {
  SearchGuiasDelegate({required this.listaGuiasAsignadas});
  final AssiggrListProvider listaGuiasAsignadas;
  List<AssiggrModel> _filtro = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    //final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context);
    return [
      IconButton(
          onPressed: () {
            query = '';

            /* print('Impresion ${listaGuiasAsignadas.asignados[0].nroguia}'); */
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(
              context,
              AssiggrModel(
                  tipoproceso: '',
                  nroguia: '',
                  fecha: '',
                  kg: 0,
                  piscina: '',
                  cant: 0,
                  placa: '',
                  registratiempo: '',
                  cedula: '',
                  sincronizado: 0,
                  activo: 0,
                  fechahorareg: ''));
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _ListDetailSearch(
        filtro: _filtro, listaGuiasAsignadas: listaGuiasAsignadas);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filtro = listaGuiasAsignadas.asignados.where((guias) {
      return guias.nroguia.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return _ListDetailSearch(
        filtro: _filtro, listaGuiasAsignadas: listaGuiasAsignadas);
  }
}

class _ListDetailSearch extends StatelessWidget {
  const _ListDetailSearch({
    Key? key,
    required List<AssiggrModel> filtro,
    required this.listaGuiasAsignadas,
  })  : _filtro = filtro,
        super(key: key);

  final List<AssiggrModel> _filtro;
  final AssiggrListProvider listaGuiasAsignadas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //itemCount: productsServices.productos.length,

        itemCount: _filtro.length,
        /*  itemBuilder: (_, indice) {
          return ListTile(
            title: Text(_filtro[indice].nroguia),
            subtitle: Text(_filtro[indice].fecha),
          );
        } */
        itemBuilder: (BuildContext context, int indice) => GestureDetector(
            onTap: () {
              listaGuiasAsignadas.guiaSeleccionada =
                  listaGuiasAsignadas.asignados[indice].copy();

              final nroguia = _filtro[indice].nroguia;
              final tipo = _filtro[indice].tipoproceso;
              final cedula = _filtro[indice].cedula;
              final activo = _filtro[indice].activo;
              if (activo == 1) {
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
            child: ListSearchGuias(
              /* asignados: listaGuiasAsignadas.asignados[indice], */
              asignados: _filtro[indice],
              //product: productsServices.productos[indice],
            )));
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
