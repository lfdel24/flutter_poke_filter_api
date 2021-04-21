import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_filter_api/pokemon/controller/pokemon_controller.dart';

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
      child: Column(
        children: [
          SizedBox(height: 16),
          Text("Listado de Pokémon"),
          Divider(),
          TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: "Buscar"),
          ),
          _BuilderButton(text: "Anterior", onTap: () {}),
          _BuilderButton(text: "Siguiente", onTap: () {}),
          _BuilderListView(),
        ],
      ),
    );
  }
}

class _BuilderButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  const _BuilderButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        color: Colors.blue,
        width: 100,
        height: 50,
        child: Text(this.text),
      ),
    );
  }
}

class _BuilderListView extends StatelessWidget {
  final controller = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemBuilder: (_, index) => ListTile(
            title: Row(
          children: [
            Text(controller.pokemonResp[index].id),
            Expanded(child: Text(controller.pokemonResp[index].name)),
          ],
        )),
      ),
    );
  }
}
