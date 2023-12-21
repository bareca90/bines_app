import 'package:bines_app/providers/providers.dart';
import 'package:flutter/material.dart';

class AssiggrListProvider extends ChangeNotifier {
  List<AssiggrModel> asignados = [];
  /* List<BinesGrAsigModel> binAsignados = []; */

  late AssiggrModel guiaSeleccionada;
  Future<AssiggrModel> nuevaGuiaPesca(String nroguia, String fecha, double kg,
      String piscina, int cant, int sincronizado, int activo) async {
    final nuevaGuiaPesca = AssiggrModel(
        tipoproceso: '',
        nroguia: nroguia,
        fecha: fecha,
        kg: kg,
        piscina: piscina,
        cant: cant,
        placa: '',
        registratiempo: '',
        cedula: '',
        sincronizado: sincronizado,
        activo: activo,
        fechahorareg: '');
    nuevaGuiaPesca.nroguia =
        await DBProvider.db.insertAsiganadas(nuevaGuiaPesca);
    asignados.add(nuevaGuiaPesca);
    notifyListeners();
    return nuevaGuiaPesca;
  }

  cargarGrAsignadas(cedula, tipo) async {
    final asignados = await DBProvider.db.consultaGrAsignadas(cedula, tipo);
    /* print(asignados); */
    this.asignados = [...?asignados];
    notifyListeners();
  }

  borrarGuiasPesca(cedula, tipo) async {
    await DBProvider.db.borrarGuiasPesca(cedula, tipo);
    cargarGrAsignadas(cedula, tipo);
  }
}
