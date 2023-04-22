import 'package:paradice/dice6.dart';
import 'package:paradice/dicepool.dart';

class DicePool6 extends DicePool{

  @override
  void addDice(){
    //cette fonction permet d'afficher des une liste de widget textpour tout nombre pair
    super.lidice.add(Dice6());
  }
}