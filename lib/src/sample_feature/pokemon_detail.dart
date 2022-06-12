import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pokedex/src/sample_feature/pokemon.dart';
import 'package:pokedex/src/sample_feature/sample_item.dart';

/// Displays detailed information about a SampleItem.
class PokemonDetail extends StatefulWidget {
  const PokemonDetail({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  final Pokemon? pokemon;

  static const routeName = '/pokemon_detail';

  @override
  createState() => PokemonState();
}

class PokemonState extends State<PokemonDetail> {
  List<Widget> getTypes() {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    List<Widget> pokeTypes = [];
    for (var pokeType in pokemon.types) {
      pokeTypes.add(Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: getTypeColor(pokeType),
              ),
              color: getTypeColor(pokeType),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text(
            pokeType,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )));
    }

    return pokeTypes;
  }

  MaterialColor getTypeColor(String pokeType) {
    switch (pokeType) {
      case 'Water':
        return Colors.blue;
      case 'Poison':
        return Colors.purple;
      case 'Fire':
        return Colors.red;
      case 'Grass':
        return Colors.green;
      case 'Flying':
        return Colors.grey;
      case 'Electric':
        return Colors.yellow;
      case 'Fighting':
        return Colors.brown;
      case 'Bug':
        return Colors.lightGreen;
      case 'Ice':
        return Colors.lightBlue;
      case 'Rock':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo;
      case 'Psychic':
        return Colors.deepPurple;
      case 'Earth':
        return Colors.amber;
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  BoxDecoration paintBackgroundByTypes() {
    List<Color> colorList = [];
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    pokemon.types.forEach((pkType) => colorList.add(getTypeColor(pkType)));
    if (colorList.length == 1) {
      return BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: colorList));
    }

    return BoxDecoration();
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    print(pokemon.name);
    return Scaffold(
      appBar: AppBar(
        title:
            Text('#' + pokemon.id.toString() + ' ' + pokemon.name["english"]),
      ),
      body: Center(
        child: Container(
          decoration: paintBackgroundByTypes(),
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(children: [
                Image.asset(
                    'assets/images/pokemon/images/' + pokemon.image + '.png'),
                Text(
                  pokemon.name["english"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: getTypes(),
                ))
              ], crossAxisAlignment: CrossAxisAlignment.center)),
        ),
      ),
    );
  }
}
