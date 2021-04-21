class PokemonModel {
  String id;
  String name;
  String imageUrl;

  PokemonModel(this.id, this.name, this.imageUrl);

  static fromJson(data) {
    return PokemonModel(data["name"], data["url"], data["url"]);
  }
}
