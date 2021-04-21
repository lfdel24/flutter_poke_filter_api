import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';

class PokemonService {
  String _url = "https://pokeapi.co/api/v2";

  Future<List<PokemonModel>> getAll() async {
    var url = Uri.parse('${this._url}/pokemon?limit=1500');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var results = json.decode(response.body)["results"];
      return results.map((e) => PokemonModel.fromJson(e)).toList();
    }
    return [];
  }
}
