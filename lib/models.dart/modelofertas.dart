class Oferta {
  Oferta({
    this.nombre,
    this.oferta_type,
    this.descripcion,
    this.honorarios,
  });

  Source nombre;
  String oferta_type;
  String descripcion;
  String honorarios;

  factory Oferta.fromJson(Map<String, dynamic> json) => Oferta(
        nombre: Source.fromJson(json["source"]),
        oferta_type: json["user_type"] ?? '',
        descripcion: json["nombres"] ?? '',
        honorarios: json["apellidos"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "source": nombre.toJson(),
        "usert_type": oferta_type,
        "nombres": descripcion,
        "apellidos": honorarios,
      };
}

class Source {
  Source({
    this.id,
    this.nombre,
  });

  dynamic id;
  String nombre;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nombre,
      };
}
