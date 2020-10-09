import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/core/models/character.dart';

class CharacterView extends StatelessWidget {
  final Character character;

  const CharacterView({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(68, 40, 29, 0.1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(151, 206, 76, 1),
          title: Text(
            "Character description",
            style: TextStyle(color: Color.fromRGBO(68, 40, 29, 1)),
          ),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(68, 40, 29, 1),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Color.fromRGBO(68, 40, 29, 0.4),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Card(
                      elevation: 16.0,
                      shadowColor: Color.fromRGBO(151, 206, 76, 1),
                      clipBehavior: Clip.antiAlias,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(character.image),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Text(
                      character.name,
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(151, 206, 76, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Gender: ${character.gender}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Location: ${character.location}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Status: ${character.status}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
