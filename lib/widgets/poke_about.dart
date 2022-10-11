import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemen/constant.dart';
import 'package:pokemen/models/pokemon.dart';

class PokeAbout extends StatelessWidget {
  final Pokemon pokeData;
  PokeAbout(this.pokeData);

  String convert(value) {
    double converted = value / 10;
    return converted.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(pokeData.description),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [ 
                      Text("Height"),
                      Text(convert(pokeData.height) + ' m', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Column(
                    children: [ 
                      Text("Species"),
                      Text(pokeData.species, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Column(
                    children: [ 
                      Text("Weight"),
                      Text(convert(pokeData.weight) + ' kg', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Abilities"),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      if (pokeData.ability1 != null) Text(toBeginningOfSentenceCase(pokeData.ability1), style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                      if (pokeData.ability2 != null) Text(toBeginningOfSentenceCase(pokeData.ability2), style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                      if (pokeData.ability3 != '') Text(toBeginningOfSentenceCase(pokeData.ability3), style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
