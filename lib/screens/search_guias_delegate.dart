import 'package:bines_app/providers/providers.dart';
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

            print('Impresion ${listaGuiasAsignadas.asignados[0].nroguia}');
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
            // TODO Aqui navego a la pantalla de Productos
            onTap: () {
              listaGuiasAsignadas.guiaSeleccionada =
                  listaGuiasAsignadas.asignados[indice].copy();

              final nroguia = _filtro[indice].nroguia;
              final listaBinGuiaAsignada =
                  Provider.of<BinGrAsignado>(context, listen: false);
              listaBinGuiaAsignada.cargarBinAsignadas(nroguia);

              //Aqui se Comenta la Invocación a la pantalla de Bines
              /* Navigator.pushReplacementNamed(context, 'asigbin'); */
            },
            child: ListSearchGuias(
              /* asignados: listaGuiasAsignadas.asignados[indice], */
              asignados: _filtro[indice],
              //product: productsServices.productos[indice],
            )));
  }
}
