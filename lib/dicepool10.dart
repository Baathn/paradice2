import 'package:paradice/dice10.dart';
import 'package:paradice/dicepool.dart';

class DicePool10 extends DicePool{

  @override
  void addDice(){
    super.lidice.add(Dice10());
  }
}