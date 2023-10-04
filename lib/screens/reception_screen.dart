import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/screens/screens.dart';

/* import 'package:bines_app/screens/search_guias_delegate.dart';
import 'package:bines_app/services/services.dart'; */
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceptionListScreen extends StatelessWidget {
  const ReceptionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* final listaGuiasAsignadas =
        Provider.of<AssiggrListProvider>(context, listen: false); */

    /* final listaGuiasServices =
        Provider.of<ServicesProvider>(context, listen: false);
    listaGuiasServices.llamarApiGuiasRegistradas('OGCE'); */

    final listadoGR = Provider.of<RegisteredGuiasProvider>(context);
    final guias = listadoGR.registrados;
    //listadoGR.cargarGrRegistradas('RSP');

    /* listaGuiasServices.loadGuiasRegistradas('OGCE'); */

    /* final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context);
    listaGuiasAsignadas.cargarGrAsignadas();
 */
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Llegada a Recepciòn'),
          actions: [
            IconButton(
                onPressed: () async {
                  showSearch(
                      context: context,
                      delegate: SearchGuiasRegDelegate(
                          listaGuiasAsignadas: listadoGR));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body:
            // Container()
            ListView.builder(
                //itemCount: productsServices.productos.length,
                /* itemCount: listaGuiasAsignadas.asignados.length, */
                itemCount: listadoGR.registrados.length,
                itemBuilder: (BuildContext context, int indice) =>
                    GestureDetector(
                        // TODO Aqui navego a la pantalla de Productos
                        onTap: () {
                          /* productsServices.selectedProduct =
                      productsServices.productos[indice].copy();
                  Navigator.pushNamed(context, 'product'); */
                          final listaBinGuiaReg =
                              Provider.of<RegisteredBinGuiasProvider>(context,
                                  listen: false);

                          final nroguia = listadoGR.registrados[indice].nroguia;
                          final tipoproceso =
                              listadoGR.registrados[indice].tipoproceso;
                          listaBinGuiaReg.cargarBinAsignadasReg(
                              nroguia, tipoproceso);

                          listadoGR.guiaSeleccionadaReg =
                              listadoGR.registrados[indice].copy();
                          Navigator.pushNamed(context, 'binsalplan');
                        },
                        child: GuiasListReg(
                          registradas: listadoGR.registrados[indice],
                          //product: productsServices.productos[indice],
                        ))),
      ),
    );
  }
}
