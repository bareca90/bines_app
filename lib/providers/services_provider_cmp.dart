import 'package:bines_app/services/services.dart';
import 'package:flutter/material.dart';

class ServicesProviderCMP extends ChangeNotifier {
  final services = DataGuiasRegServicesCMP();
  llamarApiGuiasRegistradas(
      String nroguia, String opcion, String usuario) async {
    await services.loadGuiasRegistradas(nroguia, opcion, usuario);
    notifyListeners();
  }
}
