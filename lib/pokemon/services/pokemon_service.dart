import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';

class PokemonService {
  String _url = "https://pokeapi.co/api/v2";

  Future<List<PokemoModel>> getAll() async {
    var url = Uri.parse('${this._url}/pokemon?limit=1500');
    var response = await http.get(url);
    var list = json.decode(response.body)['results'];
    List<PokemoModel> listPokemon = [];
    for (var item in list) {
      print(item['name'] + item['url']);
      listPokemon.add(PokemoModel.fromMap(item));
    }
    return listPokemon;
  }
}
