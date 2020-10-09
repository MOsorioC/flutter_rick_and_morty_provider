import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/core/constants/app_constants.dart';
import 'package:rick_and_morty_provider/core/viewmodels/CharacterViewModel.dart';
import 'package:rick_and_morty_provider/ui/widgets/base_widget.dart';
import 'package:rick_and_morty_provider/ui/widgets/character_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CharacterViewModel>(
        model: CharacterViewModel(api: Provider.of(context)),
        onModelReady: (model) => model.getCharacteres(),
        builder: (context, model, child) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(151, 206, 76, 1),
                  title: Text(
                    "Rick and morty app",
                    style: TextStyle(color: Color.fromRGBO(68, 40, 29, 1)),
                  ),
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
                            Navigator.pushNamed(
                              context,
                              RoutePath.character,
                              arguments: model.characters[index],
                            );
                          },
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          height: 1,
                        ),
                      ),
              ),
            ));
  }
}
