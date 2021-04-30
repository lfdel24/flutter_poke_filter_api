import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poke_filter_api/custom_widgets/my_progress_indicator.dart';
import 'package:poke_filter_api/pokemon/inherited_widget/my_inherited_widget.dart';
import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Solo se cargan una vez los datos de la API.
    MyInheritedWidget.of(context)!.controller.load();

    return Scaffold(
      body: _BuilderBody(),
    );
  }
}

class _BuilderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = MyInheritedWidget.of(context)!.controller;
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            "Listado de Pokémon",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          TextField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "Buscar"),
              onChanged: (value) {
                Timer(Duration(milliseconds: 750), () {
                  controller.filterPokemon(value);
                });
              }),
          SizedBox(height: 4),
          ValueListenableBuilder(
              valueListenable: controller.pokemonsCopy,
              builder: (_, List<PokemonModel> list, widget) {
                return Text('${list.length} pokémon encontrados');
              }),
          SizedBox(height: 16),
          // Row(
          //   children: [
          //     _BuilderButton(text: "Anterior", onPressed: () {}),
          //     SizedBox(height: 20),
          //     _BuilderButton(text: "Siguiente", onPressed: () {}),
          //   ],
          // ),
          // SizedBox(height: 10),
          Expanded(child: _BuilderListView()),
        ],
      ),
    );
  }
}

// class _BuilderButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const _BuilderButton({Key? key, required this.text, required this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: TextButton.styleFrom(
//         primary: Colors.blue,
//       ),
//       onPressed: this.onPressed,
//       child: Text(this.text),
//     );
//   }
// }

class _BuilderListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final controller = MyInheritedWidget.of(context)!.controller;

    return ValueListenableBuilder(
        valueListenable: controller.pokemonsCopy,
        builder: (_, List<PokemonModel> listPokemon, __) => ListView.builder(
              itemCount: listPokemon.length,
              itemBuilder: (_, i) => controller.ready.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#${i + 1} ${listPokemon[i].name}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Image.network(listPokemon[i].url, fit: BoxFit.cover,
                            loadingBuilder: (_, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return MyProgressIndicator();
                        }),
                        Divider()
                      ],
                    )
                  : MyProgressIndicator(),
            ));
  }
}
