/* import 'package:bines_app/providers/providers.dart'; */
import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/routes/app_routes.dart';
import 'package:bines_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/* import 'package:provider/provider.dart'; */

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* final listaGuiasAsignadas = Provider.of<AssiggrListProvider>(context); */
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control - Pesca (CMP)'),
        //agregar boton para logout
        actions: [
          IconButton(
              onPressed: () {
                //aqui se debe controlar quitar la
                //authServices.logout();
              },
              icon: const Icon(Icons.cloud_sync)),
          IconButton(
              onPressed: () {
                //aqui se debe controlar quitar la
                //authServices.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
              icon: const Icon(Icons.login_outlined))
        ],
      ), //Este Widget permite tener un separador entre cada linea del listview
      body: ListView.separated(
        itemCount: menuOptions.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(menuOptions[index].name,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          leading: Icon(
            menuOptions[index].icon,
            color: AppTheme.primary,
          ),
          //permite seleccionar el elemencto de la lista
          onTap: () {
            //se podra navgar a otras pantallas
            /*
            final route = MaterialPageRoute(
                builder: (context) => const ListView1Screen());
            Navigator.push(context, route);
            */
            final listaGuiasServices =
                Provider.of<ServicesProvider>(context, listen: false);
            final listadoGR =
                Provider.of<RegisteredGuiasProvider>(context, listen: false);
            final listaBinGuiaReg =
                Provider.of<RegisteredBinGuiasProvider>(context, listen: false);
            /*
             * Servicio que invoca al provider que refresca los datos de las pantallas
             */
            final ServicesProviderCMP dataGuiasDayServices =
                Provider.of<ServicesProviderCMP>(context, listen: false);

            switch (index) {
              //-------------------------
              //Registro de Bines
              //-------------------------
              case 0: // Registro Salida Planta
                dataGuiasDayServices.llamarApiGuiasRegistradas(
                    '', 'GUIAPESCAD', '1206702175');
                break;
              //-------------------------
              //Registro Salida de Planta
              //-------------------------
              case 1: //Opcion de Registro Salida de Planta
                dataGuiasDayServices.llamarApiGuiasRegistradas(
                    '', 'GUIALLEGGR', '1206702175');
                break;

              //-------------------------
              //Registro de Llegada Granaja
              //-------------------------
              case 2: //Opcion de  Registro Llegada Granja
                //-------------------------
                //Envio Datos al APi
                //-------------------------
                //-------------------------
                //1.- Cargo los datos dato que s eenviaran  hacia la bd mediante el api
                //-------------------------
                listadoGR.cargarGrRegistradas('RLG'); //Regitro Salida Planta
                //-------------------------
                //2.-  Envio los datos para que sean insertados mediante el api
                // Envio PLG como opcion para que se pueda sincronizar
                //-------------------------
                listaBinGuiaReg.envioDatosApi(
                    listaBinGuiaReg, 'PLG', 'RLG', listadoGR);
                //-------------------------
                //3.- Obtengo los datos de los registros insertaddos ya sincronizados
                //-------------------------
                listaGuiasServices.llamarApiGuiasRegistradas('ORLG', 'RLG');
                //-------------------------
                //4.- Consultar los datos insertados
                //-------------------------
                listadoGR.cargarGrRegistradas('RLG'); //Regitro Salida Planta
                //-------------------------
                //Cargo los datos
                //-------------------------
                listadoGR.cargarGrRegistradas('RLG'); //Regitro Salida Planta
                break;
              //-------------------------
              //Registro Cierre de Bin
              //-------------------------
              case 3:
                listadoGR.cargarGrRegistradas('RCB');
                break; //Regitro Salida Planta
              //-------------------------
              //Registro Salida de Granja
              //-------------------------
              case 4:
                //-------------------------
                //1.- Cargo los datos dato que s eenviaran  hacia la bd mediante el api
                //-------------------------
                listadoGR.cargarGrRegistradas('RSG'); //Regitro Salida Planta
                //-------------------------
                //2.-  Envio los datos para que sean insertados mediante el api
                // Envio PLG como opcion para que se pueda sincronizar
                //-------------------------
                listaBinGuiaReg.envioDatosApi(
                    listaBinGuiaReg, 'PSG', 'RSG', listadoGR);

                //-------------------------
                //3.- Obtengo los datos de los datos insertaddos
                //-------------------------
                listadoGR.cargarGrRegistradas('RSG');
                break; //Regitro Salida Planta
              //-------------------------
              //Registro Llegada Planta
              //-------------------------
              case 5:
                //-------------------------
                //1.- Cargo los datos dato que s eenviaran  hacia la bd mediante el api
                //-------------------------
                listadoGR.cargarGrRegistradas('RLP'); //Regitro Salida Planta
                //-------------------------
                //2.-  Envio los datos para que sean insertados mediante el api
                // Envio PLG como opcion para que se pueda sincronizar
                //-------------------------
                listaBinGuiaReg.envioDatosApi(
                    listaBinGuiaReg, 'PLP', 'RLP', listadoGR);

                //-------------------------
                //3.- Obtengo los datos de los datos insertaddos
                //-------------------------
                listadoGR.cargarGrRegistradas('RLP');
                break; //Regitro Salida Planta
              //-------------------------
              //Registro Llegada Recepcion
              //-------------------------
              case 6:
                //-------------------------
                //1.- Cargo los datos dato que s eenviaran  hacia la bd mediante el api
                //-------------------------
                listadoGR.cargarGrRegistradas('RLR'); //Regitro Salida Planta
                //-------------------------
                //2.-  Envio los datos para que sean insertados mediante el api
                // Envio PLG como opcion para que se pueda sincronizar
                //-------------------------
                listaBinGuiaReg.envioDatosApi(
                    listaBinGuiaReg, 'PLR', 'RLR', listadoGR);

                //-------------------------
                //3.- Obtengo los datos de los datos insertaddos
                //-------------------------
                listadoGR.cargarGrRegistradas('RLR');
                break; //Regitro Salida Planta
              //-------------------------
              //Registro Recibido Recepcion
              //-------------------------
              case 7:
                listadoGR.cargarGrRegistradas('RRR');
                break; //Regitro SRecibido Recepcion(Volte Bines)
            }
            Navigator.pushNamed(context, menuOptions[index].route);
          },
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: AppTheme.primary,
          ),
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
