import 'dart:async';
import 'package:rick_and_morty_provider/core/models/character.dart';
import 'package:rick_and_morty_provider/core/services/api.dart';

class CharactersService {
  final Api _api;

  CharactersService({Api api}) : _api = api;

  StreamController<List<Character>> _charactersController =
      StreamController<List<Character>>();

  Stream<List<Character>> get characters => _charactersController.stream;

  Future getCharacters() async {
    var characters = await _api.getCharacters();

    var hasCharacters = characters != null;
    if (hasCharacters) {
      _charactersController.add(characters);
    }
  }
}
