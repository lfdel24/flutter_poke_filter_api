import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poke_filter_api/my_progress_indicator.dart';
import 'package:poke_filter_api/pokemon/controller/pokemon_controller.dart';
import 'package:poke_filter_api/pokemon/model/pokemon_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BuilderBody(),
    );
  }
}

class _BuilderBody extends StatelessWidget {
  //
  final controller = PokemonController();

  @override
  Widget build(BuildContext context) {
    //
    this.controller.load();

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
                  this.controller.filterPokemon(value);
                });
              }),
          SizedBox(height: 4),
          ValueListenableBuilder(
              valueListenable: this.controller.pokemonsCopy,
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
          Expanded(
              child: _BuilderListView(
            controller: this.controller,
          )),
        ],
      ),
    );
  }
}

class _BuilderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _BuilderButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blue,
      ),
      onPressed: this.onPressed,
      child: Text(this.text),
    );
  }
}

class _BuilderListView extends StatelessWidget {
  final PokemonController controller;

  const _BuilderListView({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: this.controller.pokemonsCopy,
        builder: (_, List<PokemonModel> listPokemon, __) => ListView.builder(
              itemCount: listPokemon.length,
              itemBuilder: (_, i) => this.controller.ready.value
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
