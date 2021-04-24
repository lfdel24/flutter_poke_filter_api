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
  @override
  Widget build(BuildContext context) {
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
          Divider(),
          TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: "Buscar"),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _BuilderButton(text: "Anterior", onPressed: () {}),
              SizedBox(height: 20),
              _BuilderButton(text: "Siguiente", onPressed: () {}),
            ],
          ),
          SizedBox(height: 10),
          Expanded(child: _BuilderListView()),
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

class _BuilderListView extends StatefulWidget {
  @override
  __BuilderListViewState createState() => __BuilderListViewState();
}

class __BuilderListViewState extends State<_BuilderListView> {
  //
  final controller = PokemonController();

  @override
  void initState() {
    super.initState();
    this.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: this.controller.listenable,
        builder: (_, List<PokemonModel> listPokemon, __) => ListView.builder(
              itemCount: listPokemon.length,
              itemBuilder: (_, i) => this.controller.ready.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#${i + 1} ${listPokemon[i].name}",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Image.network(listPokemon[i].url, fit: BoxFit.cover,
                            loadingBuilder: (_, Widget child,
                                ImageChunkEvent? loadingProgress) {
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
