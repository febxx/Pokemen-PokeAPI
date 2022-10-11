import 'package:flutter/material.dart';
import 'package:pokemen/constant.dart';
import 'package:intl/intl.dart';
import 'package:pokemen/models/pokemon.dart';
import 'package:pokemen/widgets/poke_about.dart';
import 'package:pokemen/widgets/poke_moves.dart';
import 'package:pokemen/widgets/poke_stats.dart';
import 'package:provider/provider.dart';
import 'package:pokemen/poke_provider.dart';

class PokeDetail extends StatefulWidget {
  static const routeName = '/pokeDetail';

  @override
  _PokeDetailState createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  var _isInit = true;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final pokeId = ModalRoute.of(context).settings.arguments as String;
      Provider.of<PokeProvider>(context, listen: false)
          .getPokeData(pokeId)
          .then((_) {});
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<PokeProvider>(context);
    final pokeData = providerData.pokemon;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // title: Text(toBeginningOfSentenceCase(pokeData.name),),
          backgroundColor: setCardColor(pokeData.type1),
        ),
        backgroundColor: providerData.isLoading
            ? Colors.white
            : providerData.isRequestError
                ? Colors.white
                : setCardColor(pokeData.type1),
        body: providerData.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top:10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        toBeginningOfSentenceCase(pokeData.name),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.0),
                      ),
                      Text(
                        toBeginningOfSentenceCase("#"+pokeData.id),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top:10.0)),
                  Row(
                    children: [
                      if (pokeData.type1 != null) Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5.0),
                          child: Text(
                            toBeginningOfSentenceCase(pokeData.type1),
                            style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0),),
                      if (pokeData.type2 != null) Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5.0),
                          child: Text(
                            toBeginningOfSentenceCase(pokeData.type2),
                            style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top:10.0)),
                  Image.network(pokeData.sprite, width: 200.0, height: 200.0,),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), // .circular(8),
              ),
              child: SizedBox(
                height: 50,
                child: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(child: Text("About", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),),
                      Tab(child: Text("Base Stats", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),),
                      Tab(child: Text("Moves", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: PokeAbout(pokeData),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: PokeStats(pokeData),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: PokeMoves(pokeData)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}