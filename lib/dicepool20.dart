import 'package:paradice/dice20.dart';
import 'package:paradice/dicepool.dart';

class DicePool20 extends DicePool{

  @override
  void addDice(){
    super.lidice.add(Dice20());
  }
}