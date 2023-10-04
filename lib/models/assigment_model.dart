// To parse this JSON data, do
//
//     final assiggrModel = assiggrModelFromJson(jsonString);

import 'dart:convert';

AssiggrModel assiggrModelFromJson(String str) =>
    AssiggrModel.fromJson(json.decode(str));

String assiggrModelToJson(AssiggrModel data) => json.encode(data.toJson());

class AssiggrModel {
  AssiggrModel({
    required this.nroguia,
    required this.fecha,
    required this.kg,
    required this.piscina,
    required this.cant,
    required this.sincronizado,
    required this.activo,
  });

  String nroguia;
  String fecha;
  double kg;
  String piscina;
  int cant;
  int sincronizado;
  int activo;

  Map<String, dynamic> toJson() => {
        "nroguia": nroguia,
        "fecha": fecha,
        "kg": kg,
        "piscina": piscina,
        "cant": cant,
        "sincronizado": sincronizado,
        "activo": activo,
      };
  factory AssiggrModel.fromJson(Map<String, dynamic> json) => AssiggrModel(
        nroguia: json["nroguia"],
        fecha: json["fecha"],
        kg: json["kg"].toDouble(),
        piscina: json["piscina"],
        cant: json["cant"],
        sincronizado: json["sincronizado"],
        activo: json["activo"],
      );
  @override
  String toString() {
    return 'AssiggrModel{nroGuia :$nroguia,fecha:$fecha,kg:$kg,piscina:$piscina,cant:$cant,sincronizado:$sincronizado,activo:$activo}';
  }

  AssiggrModel copy() => AssiggrModel(
      nroguia: nroguia,
      fecha: fecha,
      kg: kg,
      piscina: piscina,
      cant: cant,
      sincronizado: sincronizado,
      activo: activo);
}
