import 'package:flutter/material.dart';
import 'package:paradice/dicepool.dart';
import 'package:paradice/dicepool6.dart';
import 'package:paradice/dicepool10.dart';
import 'package:paradice/dicepool20.dart';
import 'package:paradice/dicepool100.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Paradice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DicePool pool6 = DicePool6();
  DicePool pool10 = DicePool10();
  DicePool pool20 = DicePool20();
  DicePool pool100 = DicePool100();

  List<int> lizero = DicePool6().parcourir();
  List<int> lizero2 = DicePool6().getLizero();



  //int res(int i){
    //List<int> liresult = DicePool6().getPool;
    //return liresult[i];
  //}

  void _m10() {
    //cette fonction permet la supression de 10 Dé dans le compteur et dans la lidice
    setState(() {
      if( _counter > 1){
        _counter = _counter - 10;
        for (int z = 0; z < 10; z++) {
          DicePool6().removeDice();
        }
      }if (_counter <= 0){
        _counter = 1;
      }
    });
  }

  void _m1() {
    //cette fonction permet la supression de 1 Dé dans le compteur et dans la lidice
    setState(() {
      if( _counter > 1){
        _counter = _counter - 1;
        DicePool6().removeDice();
      }if (_counter <= 0){
        _counter = 1;
      }
    });
  }

  void _reset() {
    //cette fonction permet de revenir a un 1 Dé dans le compteur et dans la lidice
    setState(() {
      for (int i = 0; i < _counter; i++) {
        DicePool6().removeDice();
      }
      DicePool6().addDice;
      _counter = 1;
    });
  }

  void _p1() {
    //cette fonction permet l'ajout de 1 Dé dans le compteur et dans la lidice
    setState(() {
      _counter = _counter + 1;
      DicePool6().addDice;
    });
  }

  void _p10() {
    //cette fonction permet l'ajout de 10 Dé dans le compteur et dans la lidice
    setState(() {
      _counter = _counter + 10;
      for (int z = 0; z < 10; z++) {
        DicePool6().addDice;
      }
    });
  }
  double _moyenne = 0;


  List<Widget> liwidgetpair(){ //aide de Émilie
    //cette fonction permet d'afficher une liste de widget text pour tout nombre pair
    List<Widget> liwidget = [];
    for (int i = 0; i < lizero2.length; i++) {
      if (i % 2 == 0){
        int y = i + 1;
        liwidget.add(
            Text('Nombre de $y : ${DicePool6().resparindice(y)}'));
      }
    }
    return liwidget;
  }

  List<Widget> liwidgetimpair(){ //aide de Émilie
    //cette fonction permet d'afficher une liste de widget text pour tout nombre impair
    List<Widget> liwidget = [];
    for (int i = 0; i < lizero2.length; i++) {
      if (i % 2 == 1){
        int y = i + 1;
        liwidget.add(
            Text('Nombre de $y : ${DicePool6().resparindice(y)}'));
      }
    }
    return liwidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body:
      Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 50), child:
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(onPressed: _m10, child: const Text("-10")),
                OutlinedButton(onPressed: _m1, child: const Text("-1")),
                OutlinedButton(onPressed: _reset, child: const Text("Reset")),
                OutlinedButton(onPressed: _p1, child: const Text("+1")),
                OutlinedButton(onPressed: _p10, child: const Text("+10")),
              ]),
          ),
          const Text('Combien voulez vous de dés ?', style: TextStyle(color: Colors.red, fontSize: 40), textAlign: TextAlign.center,
          ),
           Text('$_counter', style: const TextStyle(color: Colors.red, fontSize: 75),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(children: liwidgetpair()), //aide d'Émilie
              Column(children: liwidgetimpair()), //aide d'Émilie
            ]
          )
          ],
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: DicePool6().lancerdespool,
          tooltip: 'Lancer des dés',
          backgroundColor: Colors.red,
          child: const Icon(Icons.casino),
          ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(height: 50),
      ),
    );
  }
}
