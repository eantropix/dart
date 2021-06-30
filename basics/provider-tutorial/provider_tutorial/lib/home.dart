import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'hero_model.dart';
import 'heroes_controller.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList(HeroesController heroesController) {
    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    return ListTile(
      title: Text((model.name ?? "noname")),
      trailing: (model.isFavorite ?? false)
          ? Icon(Icons.star_border)
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList(heroesController);
        },
      ),
    );
  }
}
