import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/screens/search_guias_delegate.dart';
import 'package:bines_app/services/services.dart';
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssigmentScreen extends StatelessWidget {
  const AssigmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* final listaGuiasAsignadas =
        Provider.of<AssiggrListProvider>(context, listen: false); */
    final listaGuiasServices = Provider.of<DataGuiasDayServices>(context);

    final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context);
    listaGuiasAsignadas.cargarGrAsignadas();

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Bin - Guìa'),
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
                  final listaBinGuiaAsignada =
                      Provider.of<BinGrAsignado>(context, listen: false);
                  listaBinGuiaAsignada.cargarBinAsignadas(nroguia);
                  Navigator.pushNamed(context, 'asigbin');
                },
                child: AssigmentBinCard(
                  asignados: listaGuiasAsignadas.asignados[indice],
                  //product: productsServices.productos[indice],
                ))),
      ),
    );
  }
}
