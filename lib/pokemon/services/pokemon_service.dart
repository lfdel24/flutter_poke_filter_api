import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  String _url = "https://pokeapi.co/api/v2";

  Future<List<PokemonModel>> getAll() async {
    var resp = await http.get(Uri(path: "${this._url}/pokemon?limit=1500"));
    print("resp: $resp");
    return [];
  }
}
