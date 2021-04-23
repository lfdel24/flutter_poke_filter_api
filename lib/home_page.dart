import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PokemonController().getAll(),
        builder: (_, AsyncSnapshot<List<PokemonModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, i) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![i].name,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Image.network(snapshot.data![i].url,
                            fit: BoxFit.cover,
                            alignment: Alignment.centerRight,
                            height: 100,
                            width: 100, loadingBuilder: (context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                              child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ));
                        }),
                        Divider()
                      ],
                    ));
          } else if (snapshot.hasError) {
            //Text(snapshot.error.toString());
          }
          return Center(
              child: Container(
                  width: 100, height: 100, child: CircularProgressIndicator()));
        });
  }
}
