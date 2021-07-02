import 'package:flutter/cupertino.dart';
import 'package:provider_tutorial/counter.dart';
import 'package:provider_tutorial/hero_model.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: "Deadpool"),
    HeroModel(name: "Flash"),
    HeroModel(name: "Black Panther"),
    HeroModel(name: "Subzero"),
  ];

  checkFavorite(HeroModel hero, Counter counter) {
    hero.isFavorite = !hero.isFavorite!;
    counter.increment();
    notifyListeners();
  }

  checkOnlyFavorite(HeroesController heroesController, HeroModel chosenHero,
      Counter counter) {
    Iterable<HeroModel> otherHeroes = heroesController.heroes;
    for (var hero in otherHeroes) {
      hero.isFavorite = false;
    }
    chosenHero.isFavorite = !chosenHero.isFavorite!;
    counter.increment();
    notifyListeners();
  }
}
