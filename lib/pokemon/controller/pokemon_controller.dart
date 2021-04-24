import 'package:flutter/widgets.dart';
import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';
import 'package:poke_filter_api/pokemon/services/pokemon_service.dart';

class PokemonController {
  //
  final _pokemons = <PokemonModel>[];
  final pokemonsCopy = ValueNotifier(<PokemonModel>[]);
  final ready = ValueNotifier(false);
  final service = PokemonService();
  final filter = ValueNotifier('');

  void load() async {
    this.ready.value = false;
    this._pokemons.addAll(await service.getList());
    this.pokemonsCopy.value = this._pokemons;
    this.ready.value = true;
  }

  void filterPokemon(String value) async {
    this.pokemonsCopy.value = [];
    if (value.isEmpty) {
      return this.pokemonsCopy.value.addAll(this._pokemons);
    }
    for (var item in this._pokemons) {
      if (item.name.contains(value)) {
        this.pokemonsCopy.value.add(item);
        print(item.name);
      }
    }
  }
}
