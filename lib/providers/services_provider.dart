import 'package:bines_app/models/models.dart';
import 'package:bines_app/providers/providers.dart';
import 'package:bines_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:bines_app/models/models.dart';

class ServicesProvider extends ChangeNotifier {
  final services = DataGuiasRegServices();
  llamarApiGuiasRegistradas(String tipo, String opcion) async {
    final registrados = await services.loadGuiasRegistradas(tipo, opcion);
    notifyListeners();
  }
}
