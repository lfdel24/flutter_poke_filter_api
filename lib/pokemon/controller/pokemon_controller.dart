import 'package:flutter/widgets.dart';
import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';
import 'package:poke_filter_api/pokemon/services/pokemon_service.dart';

class PokemonController {
  //
  final listenable = ValueNotifier(<PokemonModel>[]);
  final ready = ValueNotifier(false);
  final service = PokemonService();

  void init() async {
    this.ready.value = false;
    this.listenable.value = await service.getList();
    this.ready.value = true;
  }
}
