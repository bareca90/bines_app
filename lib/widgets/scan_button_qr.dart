import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButtonQR extends StatelessWidget {
  const ScanButtonQR({Key? key, required this.listaGuiasAsignadas})
      : super(key: key);
  final AssiggrListProvider listaGuiasAsignadas;

  @override
  Widget build(BuildContext context) {
    final listaGuiasBinAsignadas = Provider.of<BinGrAsignado>(context);

    DateTime now = DateTime.now();
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //Validar cuando no se escanea nada
        if (barcodeScanRes == '-1') {
          return;
        }

        //Busca en el arbol de wodgets la instancia del list provider
        /* final scanListProvider =
            // ignore: use_build_context_synchronously
            Provider.of<ScanListProvider>(context, listen: false); */
        //Provider.of<ScanListProvider>(context, listen: false);

        /* final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes); */
        //lamamamos a la pantalla en base a lo escaneado
        // ignore: use_build_context_synchronously
        /* lanzarUrl(context, nuevoScan); */
        final insertVariosGrBin = listaGuiasBinAsignadas.nuevaGuiaBinAsignado(
            listaGuiasAsignadas.guiaSeleccionada.nroguia,
            int.parse(barcodeScanRes),
            now.toString(),
            0,
            0);
        listaGuiasBinAsignadas
            .cargarBinAsignadas(listaGuiasAsignadas.guiaSeleccionada.nroguia);
        /* listaGuiasAsignadas.guiaSeleccionada =
                      listaGuiasAsignadas.asignados[indice].copy(); */
        listaGuiasBinAsignadas.catidadBinesEscaneados(
            listaGuiasAsignadas.guiaSeleccionada.nroguia);
        /* print('Guia estado : ${listaGuiasAsignadas.guiaSeleccionada.activo}'); */
        /* if (listaGuiasAsignadas.guiaSeleccionada.activo == 1) {
        } else {
          const Alert(
              titulo: 'Registo Bin - Guìa',
              texto:
                  'No se Puede Escanear Bines por que la guìa salio de Planta');
        } */
        /*  print(
            'Se Inserto el bin ${listaGuiasAsignadas.guiaSeleccionada.nroguia}, $insertVariosGrBin'); */
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
