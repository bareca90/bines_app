import 'dart:convert' as convert;
import 'package:bines_app/providers/providers.dart';
import 'package:http/http.dart' as http;

//class DataGuiasRegServices extends ChangeNotifier {
class DataGuiasRegServicesCMP {
  List<RegisteredGuias> listadoGrReg = [];
  //final serverport = '10.20.4.173:8077'; //Servidor Desarrollo
  final serverport = '10.100.120.35:8077'; //Servidor Produccion
  bool isLoading = true;
  final List<AssiggrModel> listadoGr = [];
  bool insertados = false;
  DataGuiasRegServicesCMP();

  Future<List<AssiggrModel>> loadGuiasRegistradas(
      String nroguia, String opcion, String usuario) async {
    isLoading = true;
    //notificamos  a otro cualquier otro widget que se desea
    /* notifyListeners(); */
    if (opcion == '') {
      opcion = 'GUIAPESCAD';
    }
    final queryParameters = {
      "nroguia": nroguia,
      "opcion": opcion,
      "usuario": usuario
    };
    final uri = Uri.http('10.100.120.35:8077',
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
    await DBProvider.db.borrarGuiasPesca('', opcion);
    print("Ingreso a Borrrar  =>> $opcion ");
    if (listguiasMap.isNotEmpty) {
      //Borramos los datos de las tablas no sincronziadas
      //TODO : Borrar los datos de las guias no sincronizadas
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
        /* notifyListeners(); */
      }
    }
    isLoading = false;
    //notificamos  a otro cualquier otro widget que se desea
    /* notifyListeners(); */
    return listadoGr;

    /* bool flag = false;
    final parametros = {"nroguia": "", "opcion": tipo};
    final uri = Uri.http(serverport,
        '/api-app-control-time/obtenerguiasregistradas', parametros);
    final responseGuiasReg = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

   
    final List<dynamic> listguiasMap =
        convert.jsonDecode(responseGuiasReg.body);
    if (listguiasMap.isNotEmpty) {
      //Borramos los datos de las tablas no sincronziadas
      for (Map<String, dynamic> guias in listguiasMap) {
        /*
          --------------------------------------------
          Obtiene las guias del dìa
          --------------------------------------------
        */
        final double kg = double.parse(guias['can_kg'].toString());
        final int cantescaneada = int.parse(guias['cant_bines'].toString());
        final int sincronizado = int.parse(guias['sincronizado'].toString());
        final int activo = int.parse(guias['activo'].toString());
        final String tipoproceso = guias['tipo_proceso'];
        final String nroguia = guias['nro_guia'];
        final String fechaguia = guias['fec_pesc'];
        final String piscina = guias['nro_pisc'];

        //borramos las guias registradas con ese tipo de proceso
        if (flag == false) {
          //print(tipoproceso);
          await RegisteredGuiasProvider().borrarGuiasRegistradas(tipoproceso);
          flag = true;
        }
        /* final binesAct = await BinGrAsignado().updateEstadoGuia(nroguia, 0); */
        final guiasRec = await RegisteredGuiasProvider().nuevaGuiaRegistrada(
            tipoproceso,
            nroguia,
            fechaguia,
            kg,
            piscina,
            cantescaneada,
            sincronizado,
            activo);

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
        final queryParameters = {
          "nroguia": guias['nro_guia'],
          "opcion": opcion
        };
        final uri = Uri.http(serverport,
            '/api-app-control-time/obtenerbinesguia', queryParameters);
        //final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
        final responseBin = await http.get(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        final List<dynamic> listGuiasBinMap =
            convert.jsonDecode(responseBin.body);
        /*
          --------------------------------------------
          Borrar los datos de las guias 
          --------------------------------------------
        */
        await DBProvider.db.borrarBinesGuiasSincReg(nroguia, tipoproceso);
        /*
          --------------------------------------------
          Recorre el json que viene desde el Api de Bines
          --------------------------------------------
        */
        for (Map<String, dynamic> guiasBin in listGuiasBinMap) {
          int bin = guiasBin['nrobin'];
          String fechahoraing = guiasBin['fechahora'];
          int sincbin = guiasBin['sincronizado'];
          int actbin = guiasBin['activo'];
          final guiasBinReg = await RegisteredBinGuiasProvider()
              .nuevaGuiaBinAsignadoReg(
                  tipoproceso, nroguia, bin, fechahoraing, sincbin, actbin);
        }
      }
    }
    return listadoGrReg; */
  }

  //-------------------------------
  //Consumira APi q enviarà a guardar los datos a la tabla codesp
  //-------------------------------
  Future updateRegGuiasBD(
      String opcion, String nroguia, String fecha, String tipoproceso) async {
    const int actualizado = 1;
    final response = await http.post(
        Uri.parse('http://$serverport/api-app-control-time/binesguia'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, dynamic>{
          "opcion": opcion,
          "nroguia": nroguia,
          "nrobin": 0,
          "fechahra": fecha
        }));

    final List<dynamic> decodedResp = convert.json.decode(response.body);
    final dynamic cod = decodedResp[0]['codmsg'];
    if (cod == 200) {
      print('Se Inserto los Registros Normalmente');
      final binesAct = await RegisteredBinGuiasProvider()
          .actualizarEstadosRegBin(nroguia, tipoproceso, 0, 1);

      /* BinGrAsignado()
              .updateBinesSincronizados(nroguia, 0, 1, nrobin); */
    } else {
      print('Cod Error No se Inserto Registros');
    }
    return actualizado;
  }

  //-------------------------------
  //Consumira APi q enviarà a guardar los datos a la tabla codesp
  //-------------------------------
  Future sincronizaGuiasBinRegBD(String opcion, String nroguia, String fecha,
      String tipoproceso, String relacionTabla, int nrobin) async {
    const int actualizado = 1;
    final response = await http.post(
        Uri.parse('http://$serverport/api-app-control-time/binesguia'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, dynamic>{
          "opcion": opcion,
          "nroguia": nroguia,
          "nrobin": nrobin,
          "fechahra": fecha
        }));

    final List<dynamic> decodedResp = convert.json.decode(response.body);
    final dynamic cod = decodedResp[0]['codmsg'];
    if (cod == 200) {
      if (relacionTabla == 'CAB') {
        // se Eliminara e Insertara los registros en la cabecera
        //GuiasReg
        /* final borradosCab = await RegisteredGuiasProvider()
            .borrarRegGuiasxGuia(tipoproceso, nroguia); */
      }
      if (relacionTabla == 'DET') {
        // se Eliminara e Insertara los registros en el detalle
        //BinReg
      }
      print(decodedResp[0]['descmsg']);

      /* final binesAct = await RegisteredBinGuiasProvider()
          .actualizarEstadosRegBin(nroguia, tipoproceso, 0, 1); */

      /* BinGrAsignado()
              .updateBinesSincronizados(nroguia, 0, 1, nrobin); */
    } else {
      print('Cod Error No se Inserto Registros');
    }
    return actualizado;
  }
}
