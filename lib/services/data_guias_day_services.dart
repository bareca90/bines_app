import 'dart:convert' as convert;
/* import 'dart:convert'; */
/* import 'dart:html'; */
import 'package:bines_app/models/models.dart';
import 'package:bines_app/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataGuiasDayServices extends ChangeNotifier {
  final List<AssiggrModel> listadoGr = [];
  bool isLoading = true;
  bool insertados = false;
  DataGuiasDayServices() {
    loadGuiasDay();
  }
  Future<List<AssiggrModel>> loadGuiasDay() async {
    isLoading = true;
    //notificamos  a otro cualquier otro widget que se desea
    notifyListeners();
    final queryParameters = {
      "nroguia": "",
      "opcion": "GUIAPESCAD",
      "usuario": ""
    };
    final uri = Uri.http('10.20.4.173:8077',
        '/api-app-control-time/obtenerguias', queryParameters);
    final responseGuias = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    /* final List<dynamic> listGuiasBinMap =convert.jsonDecode(responseGuias.body); */
    /* final response = await http.get(Uri.parse(_baseUrl)); */
    final List<dynamic> listguiasMap = convert.jsonDecode(responseGuias.body);
    if (listguiasMap.isNotEmpty) {
      //Borramos los datos de las tablas no sincronziadas
      //TODO : Borrar los datos de las guias no sincronizadas
      await DBProvider.db.borrarGuiasPesca('', 'GUIAPESCAD');
      //Recorremos el Json y Realizamos el Insert
      for (Map<String, dynamic> guias in listguiasMap) {
        /*
          --------------------------------------------
          Obtiene las guias del dìa 
          --------------------------------------------
        */
        final double kg = double.parse(guias['can_kg'].toString());
        final int cantbin = int.parse(guias['cant_bines'].toString());
        final int sincronizado = int.parse(guias['sincronizado'].toString());
        final int activo = int.parse(guias['activo'].toString());
        final nuevaGuiaPesca = AssiggrModel(
          tipoproceso: guias['tipoproceso'],
          nroguia: guias['nro_guia'],
          fecha: guias['fec_pesc'],
          kg: kg,
          piscina: guias['nro_pisc'],
          cant: cantbin,
          placa: guias['placa'],
          registratiempo: guias['registratiempo'],
          cedula: guias['cedula'],
          sincronizado: sincronizado,
          activo: activo,
          fechahorareg: guias['fechahorareg'],
        );
        nuevaGuiaPesca.nroguia =
            await DBProvider.db.insertAsiganadas(nuevaGuiaPesca);
        /*
          --------------------------------------------
            Obtiene e Inserta los bines y sus guias
          --------------------------------------------
        */
        /*
          --------------------------------------------
            Consumimos el Api 
          --------------------------------------------
        */
        /* final queryParameters = {
          "nroguia": guias['nro_guia'],
          "opcion": "BAGR"
        };
        final uri = Uri.http('10.20.4.173:8077',
            '/api-app-control-time/obtenerbinesguia', queryParameters);
        final responseBin = await http.get(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        final List<dynamic> listGuiasBinMap =
            convert.jsonDecode(responseBin.body); */

        /*
          --------------------------------------------
          Borrar los datos de las guias 
          --------------------------------------------
        */
        /* await DBProvider.db.borrarBinesGuiasSinc(guias['nro_guia']); */

        /*
          --------------------------------------------
          Recorre el json que viene desde el Api de Bines
          --------------------------------------------
        */
        /* for (Map<String, dynamic> guiasBin in listGuiasBinMap) {
          final nuevoBinGuia = BinesGrAsigModel(
              nroguia: guiasBin['nroguia'],
              nrobin: guiasBin['nrobin'],
              fechahora: guiasBin['fechahora'],
              sincronizado: guiasBin['sincronizado'],
              activo: guiasBin['activo']);
          nuevoBinGuia.nrobin =
              await DBProvider.db.insertBinGrAsiganadas(nuevoBinGuia);

          
        } */
        /* print('Guia Bin ${responseBin.body}'); */

        insertados = true;
        notifyListeners();
      }
    }
    isLoading = false;
    //notificamos  a otro cualquier otro widget que se desea
    notifyListeners();
    return listadoGr;
  }
}
