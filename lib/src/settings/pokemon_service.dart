import '../sample_feature/pokemon.dart';

class PokemonService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  late Pokemon pokemonEscolhido;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  updatePokemon(Pokemon pokemon) {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    pokemonEscolhido = pokemon;
  }

  Pokemon getPokemonEscolhido() {
    return pokemonEscolhido;
  }
}
