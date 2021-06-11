// To parse this JSON data, do
//
//     final favoritoModel = favoritoModelFromJson(jsonString);

import 'dart:convert';

FavoritoModel favoritoModelFromJson(String str) =>
    FavoritoModel.fromJson(json.decode(str));

String favoritoModelToJson(FavoritoModel data) => json.encode(data.toJson());

class FavoritoModel {
  FavoritoModel({
    required this.titulo,
  });

  String titulo;

  factory FavoritoModel.fromJson(Map<String, dynamic> json) => FavoritoModel(
        titulo: json["titulo"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
      };
}

List<FavoritoModel> favoritos = [
  FavoritoModel(titulo: "Favorito 1"),
  FavoritoModel(titulo: "Favorito 2"),
];

List<FavoritoModel> actividadesRecientes = [
  FavoritoModel(titulo: "Cuenca  - Quito"),
  FavoritoModel(titulo: "Guayaquil - Cuenca"),
];
