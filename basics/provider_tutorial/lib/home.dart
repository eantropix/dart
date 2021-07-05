import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

import 'hero_model.dart';
import 'heroes_controller.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);
    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);
    Counter counter = Provider.of<Counter>(context);
    return ListTile(
      onTap: () {
        heroesController.checkFavorite(model, counter);
      },
      onLongPress: () {
        heroesController.checkOnlyFavorite(heroesController, model, counter);
      },
      title: Text((model.name!)),
      trailing: (model.isFavorite ?? false)
          ? Icon(Icons.star, color: Colors.yellow)
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    var subscription = flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.name != "") {
          print("${r.device.name} found! rssi: ${r.rssi}");
        }
      }
    });
    flutterBlue.stopScan();
    return Scaffold(
      appBar: AppBar(
        // title: Text("Provider"),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Center(
              widthFactor: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Text(
                  //   "Favorites clicked: ",
                  //   textAlign: TextAlign.start,
                  // ),
                  Text(
                    "${counter.count}",
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              // child: Text(
              //   "${heroesController.heroes.where((hero) => hero.isFavorite!).length}",
              //   style: TextStyle(color: Colors.white),
              // ),
            );
          },
        ),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => counter.increment(),
      //   tooltip: "Increment",
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
