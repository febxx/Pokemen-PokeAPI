import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemen/constant.dart';
import 'package:pokemen/poke_details.dart';

class PokeCard extends StatelessWidget {
  final dynamic poke;
  final BuildContext context;

  const PokeCard(this.poke, this.context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
            .pushNamed(PokeDetail.routeName, arguments: poke.id);
        },
        child: Card(
        elevation: 5,
        color: setCardColor(poke.type1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 10, 0),
          child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    toBeginningOfSentenceCase(poke.name),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (poke.type1 != null) Padding(
                          padding: const EdgeInsets.only(bottom:5.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:5.0),
                              child: Text(
                                toBeginningOfSentenceCase(poke.type1),
                                style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        if (poke.type2 != null) Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:5.0),
                            child: Text(
                              toBeginningOfSentenceCase(poke.type2),
                              style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    (toBeginningOfSentenceCase(poke.type1) != 'Fighting') ? Image.network(poke.sprite, width: 90.0, height: 90.0,) : (toBeginningOfSentenceCase(poke.type1) != 'Fighting') ? Image.network(poke.sprite, width: 90.0, height: 90.0,) : Image.network(poke.sprite, width: 80.0, height: 80.0,),
                    // (poke.type2 != "fighting") ? Image.network(poke.sprite, width: 90.0, height: 90.0,) : Image.network(poke.sprite, width: 80.0, height: 80.0,),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
