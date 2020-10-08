import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/core/models/character.dart';
import 'package:rick_and_morty_provider/core/services/api.dart';

import 'core/services/charactersService.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, CharactersService>(
    update: (context, api, charactersService) => CharactersService(api: api),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<List<Character>>(
    create: (context) =>
        Provider.of<CharactersService>(context, listen: false).characters,
  )
];
