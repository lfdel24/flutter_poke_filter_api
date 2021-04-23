class PokemoModel {
  PokemoModel({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemoModel.fromMap(Map<String, dynamic> json) => PokemoModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
