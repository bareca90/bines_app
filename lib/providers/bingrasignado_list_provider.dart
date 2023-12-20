import 'package:bines_app/models/models.dart';
import 'package:bines_app/providers/providers.dart';
import 'package:flutter/material.dart';

class BinGrAsignado extends ChangeNotifier {
  List<BinesGrAsigModel> binAsignados = [];
  int cantescaneados = 0;
  int actualizado = 0;
  Future<BinesGrAsigModel> nuevaGuiaBinAsignado(String nroguia, int nrobin,
      String fechahora, int sincronizado, int activo) async {
    final nuevoBinGuia = BinesGrAsigModel(
        nroguia: nroguia,
        nrobin: nrobin,
        fechahora: fechahora,
        sincronizado: sincronizado,
        activo: activo);
    nuevoBinGuia.nrobin =
        await DBProvider.db.insertBinGrAsiganadas(nuevoBinGuia);
    binAsignados.add(nuevoBinGuia);
    notifyListeners();
    return nuevoBinGuia;
  }

  cargarBinAsignadas(String nroguia) async {
    final binAsignados = await DBProvider.db.consultaBinAsignadas(nroguia);
    this.binAsignados = [...?binAsignados];
    catidadBinesEscaneados(nroguia);
    /* print(binAsignados); */
    notifyListeners();
  }

  borrarBinesGuia(String nroguia) async {
    await DBProvider.db.borrarBinesGuias(nroguia);
    cargarBinAsignadas(nroguia);
  }

  borrarBinGuia(String nroguia, int nrobin) async {
    await DBProvider.db.borrarBinEscanead(nroguia, nrobin);
    cargarBinAsignadas(nroguia);
  }

  catidadBinesEscaneados(String nroguia) async {
    final cantescaneados = await DBProvider.db.cantidadBinesEscaneados(nroguia);
    this.cantescaneados = cantescaneados;
    notifyListeners();
  }

  updateGuiaSincronizada(String nroguia, int activo, int sincronizado,
      String tipo, String fecha) async {
    final actualizado = await DBProvider.db
        .actualizaGuiaSincronizada(nroguia, activo, sincronizado, tipo, fecha);
    this.actualizado = actualizado;

    cargarBinAsignadas(nroguia);
    notifyListeners();
  }

  updateBinesSincronizados(
      String nroguia, int activo, int sincronizado, int nrobin) async {
    final actualizado = await DBProvider.db
        .actSincGrBines(nroguia, activo, sincronizado, nrobin);
    this.actualizado = actualizado;
    cargarBinAsignadas(nroguia);
    notifyListeners();
  }

  updateEstadoGuia(String nroguia, int activo) async {
    final actualizado = await DBProvider.db.actGrEstado(nroguia, activo);
    this.actualizado = actualizado;
    cargarBinAsignadas(nroguia);
    notifyListeners();
  }
}
