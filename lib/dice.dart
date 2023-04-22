import 'dart:math';

abstract class Dice{
  int _nbrfaces = 0;
  int _resfaces = 0;

  Dice();

  int getFaces(){
    return _nbrfaces;
  }

  int getResult(){
    return _resfaces;
  }

  void lancer() {
    Random random = Random();
    _resfaces = random.nextInt(_nbrfaces)+1;
  }

}