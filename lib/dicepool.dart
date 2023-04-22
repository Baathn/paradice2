import 'package:paradice/dice.dart';
import 'package:paradice/dice6.dart';

abstract class DicePool{
  List<Dice> lidice = [Dice6(),Dice6(),Dice6(),Dice6(),Dice6(),Dice6()];
  List<int> liresult = [];
  List<int> lizero = [0,0,0,0,0,0];

  void addDice(){
  }

  void removeDice() {
    lidice.removeAt(0);
  }

  void lancerdespool() {
    for (Dice resultats in lidice){
      resultats.lancer();
    }
  }

  List<int> getPool(){
    return liresult;
  }

  List<int> getLizero() {
    return lizero;
  }


  List<int> parcourir() {
    for (int z = 0; z < lidice.length; z++) {
      Dice6().lancer;
      int a = Dice6().getResult();
      liresult.add(a);
    }
    for (int z = 0; z <= 6; z++){
      for (int u = 0; u < liresult.length; u++) {
        if (z == liresult[u]) {
          lizero[z] = lizero[z] + 1;
        }
      }
    }
    return liresult;
  }

  int resparindice(int i){
    parcourir();
    return lizero[i];
  }
 }