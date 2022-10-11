import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemen/constant.dart';
import 'package:pokemen/models/pokemon.dart';

class PokeMoves extends StatelessWidget {
  final Pokemon pokeData;
  PokeMoves(this.pokeData);

  Widget moveLabel(String text, dynamic pokeData) {
    return Container(
      decoration: BoxDecoration(
        color: setTypeColor(pokeData.type1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          toBeginningOfSentenceCase(text),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 7,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List movesList = pokeData.moves;
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        childAspectRatio: 6 / 1.5,
        crossAxisSpacing: 5,
        children: movesList.map((item) => moveLabel(item, pokeData)).toList(),
      ),
    );
  }
}
