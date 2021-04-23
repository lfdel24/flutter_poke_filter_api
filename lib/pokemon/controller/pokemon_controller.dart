import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';
import 'package:poke_filter_api/pokemon/services/pokemon_service.dart';

class PokemonController {
  Future<List<PokemoModel>> getAll() async {
    return await PokemonService().getAll();
  }
}
