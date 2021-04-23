import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';

class PokemonService {
  String _url = "https://pokeapi.co/api/v2";

  Future<List<PokemonModel>> getAll() async {
    var url = Uri.parse('${this._url}/pokemon?limit=1500');
    var response = await http.get(url);
    var results = json.decode(response.body)['results'];
    List<PokemonModel> list = [];
    for (var result in results) {
      list.add(PokemonModel.fromMap(result));
    }
    return list;
  }
}
