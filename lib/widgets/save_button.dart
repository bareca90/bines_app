import 'package:flutter/material.dart';
/* import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'; */

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        /* String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //Validar cuando no se escanea nada
        if (barcodeScanRes == '-1') {
          return;
        } */

        //Busca en el arbol de wodgets la instancia del list provider
        /* final scanListProvider =
            // ignore: use_build_context_synchronously
            Provider.of<ScanListProvider>(context, listen: false); */
        //Provider.of<ScanListProvider>(context, listen: false);

        /* final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes); */
        //lamamamos a la pantalla en base a lo escaneado
        // ignore: use_build_context_synchronously
        /* lanzarUrl(context, nuevoScan); */
        print('Se Guardo Registro');
      },
      child: const Icon(Icons.save),
    );
  }
}
