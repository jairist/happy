// To parse this JSON data, do
//
//     final proveedorModelo = proveedorModeloFromJson(jsonString);

import 'dart:convert';

ProveedorModelo proveedorModeloFromJson(String str) => ProveedorModelo.fromJson(json.decode(str));

String proveedorModeloToJson(ProveedorModelo data) => json.encode(data.toJson());

class ProveedorModelo {
    String nombre;
    String descripcion;

    ProveedorModelo({
        this.nombre,
        this.descripcion = '',
    });

    factory ProveedorModelo.fromJson(Map<String, dynamic> json) => ProveedorModelo(
        nombre          : json["nombre"],
        descripcion     : json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "Descripcion": descripcion,
    };
}
