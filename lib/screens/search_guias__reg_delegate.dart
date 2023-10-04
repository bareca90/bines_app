import 'package:bines_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class SearchGuiasRegDelegate extends SearchDelegate {
  SearchGuiasRegDelegate({required this.listaGuiasAsignadas});
  final RegisteredGuiasProvider listaGuiasAsignadas;
  List<RegisteredGuias> _filtro = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    //final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context);
    return [
      IconButton(
          onPressed: () {
            query = '';

            print('Impresion ${listaGuiasAsignadas.registrados[0].nroguia}');
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
              RegisteredBinGuias(
                  tipoproceso: '',
                  nroguia: '',
                  nrobin: 0,
                  fechahoraesc: '',
                  activo: 0,
                  sincronizado: 0));
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
    _filtro = listaGuiasAsignadas.registrados.where((guias) {
      return guias.nroguia.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return _ListDetailSearch(
        filtro: _filtro, listaGuiasAsignadas: listaGuiasAsignadas);
  }
}

class _ListDetailSearch extends StatelessWidget {
  const _ListDetailSearch({
    Key? key,
    required List<RegisteredGuias> filtro,
    required this.listaGuiasAsignadas,
  })  : _filtro = filtro,
        super(key: key);

  final List<RegisteredGuias> _filtro;
  final RegisteredGuiasProvider listaGuiasAsignadas;

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
              listaGuiasAsignadas.guiaSeleccionadaReg =
                  listaGuiasAsignadas.registrados[indice].copy();

              final nroguia = _filtro[indice].nroguia;
              final tipoproceso = _filtro[indice].tipoproceso;
              final listaBinGuiaAsignada =
                  Provider.of<RegisteredBinGuiasProvider>(context,
                      listen: false);
              listaBinGuiaAsignada.cargarBinAsignadasReg(nroguia, tipoproceso);
              /* Navigator.pushNamed(context, 'asigbin'); */
              switch (tipoproceso) {
                case 'RSP':
                  Navigator.pushReplacementNamed(context, 'binsalplan');
              }
            },
            child: ListSearchGuiasReg(
              /* asignados: listaGuiasAsignadas.asignados[indice], */
              asignados: _filtro[indice],
              //product: productsServices.productos[indice],
            )));
  }
}
