import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_provider/core/constants/app_constants.dart';
import 'package:rick_and_morty_provider/core/models/character.dart';

class Api {
  var client = http.Client();

  String endpoint = AppConstants.baseApiUrl;

  Future<List<Character>> getCharacters() async {
    var characters = List<Character>();
    // get characters
    var response = await client.get('$endpoint/character/');

    // parse into List
    var jsonObject = json.decode(response.body) as Map<String, dynamic>;

    // loop and convert each item to Post
    for (var post in jsonObject['results']) {
      characters.add(Character.fromJson(post));
    }

    return characters;
  }
}
