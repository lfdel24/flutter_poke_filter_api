class PokemonModel {
  PokemonModel({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    var urlArr = json["url"].split('/');
    var id = urlArr[6];
    var imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    return PokemonModel(
      name: json["name"],
      url: imageUrl,
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
