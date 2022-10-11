import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemen/constant.dart';
import 'package:pokemen/models/pokemon.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PokeStats extends StatelessWidget {
  final Pokemon pokeData;
  PokeStats(this.pokeData);

  int convert(value) {
    double converted = value * 100.0;
    return converted.toInt();
  }

  Widget rowBuilder(String text, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            child: Text(text),
          ),
          SizedBox(width: 25),
          Container(
            width: 80.0,
            child: Text('$value', style: TextStyle(fontWeight: FontWeight.w600,),)
          ),
          Container(
            padding: EdgeInsets.only(top:4.0),
            child: LinearPercentIndicator(
              width: 150.0,
              lineHeight: 6.0,
              percent: (value/100) <= 1 ? (value/100) : 1,
              progressColor: setCardColor(pokeData.type1),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                rowBuilder('HP', convert(pokeData.hp)),
                rowBuilder('Attack', convert(pokeData.attack)),
                rowBuilder('Defense', convert(pokeData.defense)),
                rowBuilder('Sp. Attack', convert(pokeData.spAttack)),
                rowBuilder('Sp. Defense', convert(pokeData.spDefense)),
                rowBuilder('Speed', convert(pokeData.speed)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
