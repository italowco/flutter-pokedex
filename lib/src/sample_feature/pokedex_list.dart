import 'package:flutter/material.dart';
import 'package:pokedex/src/sample_feature/pokemon.dart';
import 'package:pokedex/src/sample_feature/pokemon_detail.dart';

import '../settings/settings_view.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

/// Displays a list of SampleItems.
class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);
  static const routeName = '/pokedex';
  @override
  createState() => _PokemonList();
}

class _PokemonList extends State {
  late List<Pokemon> items = [];

  Future<void> readJson() async {
    final List<Pokemon> pokemonList = [];
    final String response =
        await rootBundle.loadString('assets/images/pokemon/pokedex.json');
    final data = await json.decode(response);
    if (!data.isEmpty) {
      int i = 1;
      for (var poke in data) {
        String imageIndex = "";
        if (i < 10) {
          imageIndex += '00';
          imageIndex += i.toString();
        } else if (i < 100) {
          imageIndex += '0';
          imageIndex += i.toString();
        } else {
          imageIndex += i.toString();
        }
        final Pokemon newPoke =
            Pokemon(poke["id"], poke["name"], imageIndex, poke['type']);

        pokemonList.add(newPoke);
        print(newPoke.name);
        i++;
      }
    }
    setState(() {
      items = pokemonList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ListTile(
              title: Text(item.name["english"]),
              leading: CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: AssetImage(
                      'assets/images/pokemon/images/' + item.image + '.png')),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.pushNamed(context, PokemonDetail.routeName,
                    arguments: item);
              });
        },
      ),
    );
  }
}
