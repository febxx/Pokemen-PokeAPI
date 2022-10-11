import 'package:flutter/material.dart';
import 'package:pokemen/poke_card.dart';
import 'package:pokemen/poke_provider.dart';
import 'package:provider/provider.dart';
import 'package:pokemen/poke_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokeProvider(),
      child: MaterialApp(
        title: 'Pokemen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          PokeDetail.routeName: (ctx) => PokeDetail(),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokeProvider>(context, listen: false).getHomeData();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<PokeProvider>(context, listen: false).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PokeProvider>(context);
    final pokeData = data.pokeList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemen Dex", style: TextStyle(fontSize: 24.0,color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Color (0xFFFFD43B),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: data.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshData(context),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: pokeData
                          .map((poke) => PokeCard(poke, context))
                          .toList(),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
