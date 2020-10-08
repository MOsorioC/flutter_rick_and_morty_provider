import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/core/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  final Function onTap;

  const CharacterItem({this.character, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(60, 62, 68, 1),
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(character.image),
            ),
            title: Text(
              character.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '${character.gender}\n${character.location}',
              style: TextStyle(color: Colors.white),
            ),
            isThreeLine: true,
          )
        ],
      ),
    );
  }
}
