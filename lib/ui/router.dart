import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_provider/core/constants/app_constants.dart';
import 'package:rick_and_morty_provider/core/models/character.dart';
import 'package:rick_and_morty_provider/ui/views/CharacterView.dart';
import 'package:rick_and_morty_provider/ui/views/HomeView.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return MaterialPageRoute(builder: (_) => HomeView());

      case RoutePath.character:
        var character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterView(
                  character: character,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
