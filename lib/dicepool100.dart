import 'package:paradice/dice100.dart';
import 'package:paradice/dicepool.dart';

class DicePool100 extends DicePool{

  @override
  void addDice(){
    super.lidice.add(Dice100());
  }
}