import 'package:flutter/widgets.dart';
import 'package:poke_filter_api/pokemon/controller/pokemon_controller.dart';

class MyInheritedWidget extends InheritedWidget {
  final Widget child;
  final PokemonController controller;

  MyInheritedWidget({required this.child, required this.controller})
      : super(child: child);

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(
        aspect: PokemonController);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw false;
  }
}
