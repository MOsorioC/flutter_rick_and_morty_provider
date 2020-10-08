import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/core/models/character.dart';
import 'package:rick_and_morty_provider/core/services/api.dart';
import 'package:rick_and_morty_provider/core/viewmodels/BaseViewModel.dart';

class CharacterViewModel extends BaseViewModel {
  Api _api;

  CharacterViewModel({@required Api api}) : _api = api;

  List<Character> characters;

  Future getCharacteres() async {
    setBusy(true);
    characters = await _api.getCharacters();
    setBusy(false);
  }
}
