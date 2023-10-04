import 'package:bines_app/themes/app_themes.dart';
import 'package:bines_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExitPlantScreen extends StatelessWidget {
  const ExitPlantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro Salida Planta'),
          //agregar boton para logout
          actions: [
            IconButton(
                onPressed: () {
                  //aqui se debe controlar quitar la
                  //authServices.logout();
                  //Navigator.pushReplacementNamed(context, 'login');
                },
                icon: const Icon(Icons.delete)),
            IconButton(
                onPressed: () {
                  //aqui se debe controlar quitar la
                  //authServices.logout();
                  //Navigator.pushReplacementNamed(context, 'login');
                },
                icon: const Icon(Icons.cloud_upload_rounded))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              color: AppTheme.primary,
              height: 120,
              /* child: const AssignedCardHeader(), */
            ),
            /* const AssignedListBin() */
            /* Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (_, indice) => Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: AppTheme.second,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.assignment,
                      color: AppTheme.primary,
                    ),
                    title: const Text('BIN # 16'),
                    subtitle: const Text('02-08-2022'),
                    trailing: Icon(
                        //Aqui averiguamos el tipo que nos llega y en base a eso mostramos el icono, ya sea del mapa o de las direcciones
                        sincronizado == true
                            ? Icons.cloud_done
                            : Icons.cloud_off,
                        color: sincronizado == true
                            ? AppTheme.upload
                            : AppTheme.second),
                  )),
            )) */
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const SaveButton()
        /* FloatingActionButton(
        onPressed: () async {
          //TODO :  Guardar Producto
        if (!productForm.isValidaForm()) return;
          await productService.updateProducts(productForm.product); 
        }, 
        child: const Icon(Icons.qr_code_scanner_rounded),
      ), */
        );
  }
}
