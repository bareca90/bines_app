import 'dart:convert';
/* import 'dart:html'; */
/* import 'package:bines_app/models/models.dart'; */
import 'package:bines_app/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class DataGuiaBinServices extends ChangeNotifier {
  List<BinesGrAsigModel> binAsignadosGuias = [];
  bool isLoading = true;
  DataGuiaBinServices();

  //listaBinGuiaAsignada.cargarBinAsignadas(nroguia);
  Future insertBinGuias(BinGrAsignado listaBinGuiaAsignada) async {
    //TODO : Validar que exista conexion con el api
    const String opcion = 'RBG'; //Registro Bin GUia
    for (int index = 0;
        index < listaBinGuiaAsignada.binAsignados.length;
        index++) {
      final int nrobin = listaBinGuiaAsignada.binAsignados[index].nrobin;
      final String fechora = listaBinGuiaAsignada.binAsignados[index].fechahora;
      final String nroguia = listaBinGuiaAsignada.binAsignados[index].nroguia;
      final int sincronizo =
          listaBinGuiaAsignada.binAsignados[index].sincronizado;

      if (sincronizo == 0) {
        //si fue sincronizado no lo considero
        final response = await http.post(
            //10.20.4.173:8077 Servidor Desarrollo
            Uri.parse(
                'http://10.100.120.35:8077/api-app-control-time/binesguia'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              "opcion": opcion,
              "nroguia": nroguia,
              "nrobin": nrobin,
              "fechahra": fechora
            }));

        final List<dynamic> decodedResp = json.decode(response.body);
        final dynamic cod = decodedResp[0]['codmsg'];
        if (cod == 200) {
          await BinGrAsignado().updateBinesSincronizados(nroguia, 0, 1, nrobin);

          notifyListeners();
        } else {
          print('Cod Error ');
        }
      }
      /* print('Datos de la Respuesta ${response.body} '); */
    }
    isLoading = false;
    notifyListeners();
    return binAsignadosGuias;
  }

  //listaBinGuiaAsignada.cargarBinAsignadas(nroguia);
  Future insertGuiaProcesada(
      String nroguia, String opcion, String tipo, String usuario) async {
    //si fue sincronizado no lo considero
    //TODO : Validar que exista conexion con el api
    final response = await http.post(
        //10.20.4.173:8077 Servidor Desarrollo
        Uri.parse(
            'http://10.100.120.35:8077/api-app-control-time/regtiempoguia'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "opcion": opcion,
          "nroguia": nroguia,
          "usuario": usuario
        }));

    final List<dynamic> decodedResp = json.decode(response.body);
    final dynamic cod = decodedResp[0]['codmsg'];
    final String fecha = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
    /* print('Datos del json devuelto en el api $decodedResp'); */
    if (cod == 200) {
      await BinGrAsignado().updateGuiaSincronizada(nroguia, 0, 1, tipo, fecha);
      notifyListeners();
    } else {
      /* print('Cod Error '); */
    }

    isLoading = false;
    notifyListeners();
    return binAsignadosGuias;
  }

  /* cargarBinAsignadasServ(String nroguia) async {
    final binAsignadosGuias = await DBProvider.db.consultaBinAsignadas(nroguia);
    this.binAsignadosGuias = [...?binAsignadosGuias];
    /* catidadBinesEscaneados(nroguia); */
    notifyListeners();
  } */
}
