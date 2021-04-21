import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => ListTile(),
    );
  }
}
