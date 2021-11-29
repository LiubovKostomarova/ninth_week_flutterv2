import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class Card {
  final String picture;
  final String name;
  final String description;

  Card(this.picture, this.name, this.description);
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class SwitchState extends InheritedWidget {
    bool isSwitched;

  //bool isSwitched;
  SwitchState(bool isSwitched, {
    @required this.isSwitched,
    @required Widget child, bool isSwitched,
  })  : assert(isSwitched != false),
        assert(child != null),
        super(child: child);

  @override
  bool updateShouldNotify(covariant SwitchState oldWidget) =>
      oldWidget.isSwitched != isSwitched;

  static bool of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SwitchState>()?.isSwitched;
  /* @override
  bool updateShouldNotify(SwitchState old) => false;*/
}

class _HomePageState extends State<HomePage> {
  bool isSwitched = false;

  List<Card> cards = [
    Card('assets/images/maldives.jpg', 'Maldives',
        'Home to 1,192 coral islands, the tropical paradise of Maldives country lies in the Indian Ocean to the southern side of Sri Lanka. The islands sheltered in this archipelago are categorized into natural atolls, most of which remain uninhabited.'),
    Card('assets/images/alpes.jpg', 'Swiss Alps',
        'Travelling for Switzerland is going across mountains and lakes.  During the winter in the Alps, the ski hotels resorts is the engine of the country because their tracks are considered the best in the world.')
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
              child: Column(children: [SwitchState(isSwitched: isSwitched, child: 
        Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.pink,
            activeColor: Colors.pinkAccent,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.blue),
        Stack(alignment: Alignment.center, children: <Widget>[
          Image.asset(isSwitched ? cards[0].picture : cards[1].picture,
              height: 500,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
          Positioned(
              bottom: 10,
              child: Column(children: <Widget>[
                SizedBox(
                    width: 300.0,
                    height: 150.0,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                            child: Text(
                          isSwitched
                              ? cards[0].description
                              : cards[1].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )))),
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isSwitched ? cards[0].name : cards[1].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ))
              ]))
        ])
  )])));
}

/*class CounterBar extends StatelessWidget {
  final int counter;
  CounterBar({@required this.counter}) : assert(counter != null);

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.blueGrey,
      width: 200,
      height: 200,
      padding: EdgeInsets.all(12.0),
      child: Center(child: CounterText(counter: counter)));
}

class CounterText extends StatelessWidget {
  final int counter;
  CounterText({@required this.counter}) : assert(counter != null);

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.black,
      padding: EdgeInsets.all(12.0),
      child: Text("Счетчик: $counter", style: TextStyle(color: Colors.white)));
}*/
