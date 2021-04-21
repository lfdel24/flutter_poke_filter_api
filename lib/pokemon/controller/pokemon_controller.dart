import 'package:get/get.dart';
import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';
import 'package:poke_filter_api/pokemon/services/pokemon_service.dart';

class PokemonController extends GetxController {
  //Obs
  var pokemonResp = <PokemonModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    this.pokemonResp.value = await PokemonService().getAll();
  }
}
