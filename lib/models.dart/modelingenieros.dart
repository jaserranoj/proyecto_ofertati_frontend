class Ingeniero {
  Ingeniero({
    this.source,
    this.user_type,
    this.nombres,
    this.apellidos,
    this.correo,
    this.celular,
    this.perfil,
    this.urlToImage,
  });

  Source source;
  String user_type;
  String nombres;
  String apellidos;
  String correo;
  String celular;
  String perfil;
  String urlToImage;

  factory Ingeniero.fromJson(Map<String, dynamic> json) => Ingeniero(
        source: Source.fromJson(json["source"]),
        user_type: json["user_type"] ?? '',
        nombres: json["nombres"] ?? '',
        apellidos: json["apellidos"] ?? '',
        correo: json["correo"] ?? '',
        celular: json["celular"] ?? '',
        perfil: json["perfil"] ?? '',
        urlToImage: json["url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "usert_type": user_type,
        "nombres": nombres,
        "apellidos": apellidos,
        "correo": correo,
        "celular": celular,
        "perfil": perfil,
        "urlToImage": urlToImage,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  dynamic id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
