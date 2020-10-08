import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/core/viewmodels/CharacterViewModel.dart';
import 'package:rick_and_morty_provider/ui/widgets/base_widget.dart';
import 'package:rick_and_morty_provider/ui/widgets/character_item.dart';

class HommeView extends StatelessWidget {
  const HommeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CharacterViewModel>(
        model: CharacterViewModel(api: Provider.of(context)),
        onModelReady: (model) => model.getCharacteres(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(35, 35, 41, 1),
                title: Text("Rick and morty app"),
              ),
              backgroundColor: Color.fromRGBO(35, 35, 41, 0.7),
              body: model.isBusy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: model.characters.length,
                      itemBuilder: (context, index) => CharacterItem(
                        character: model.characters[index],
                        onTap: () {
                          print("Hola we");
                        },
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
            ));
  }
}
