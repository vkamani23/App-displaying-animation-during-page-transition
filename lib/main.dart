import 'package:flutter/material.dart';
import 'package:gogame_demo_app/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoGame Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Avengers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MySuperHero {
  final String img;
  final String title;
  final String body;

  MySuperHero(this.img, this.title, this.body);
}

class _MyHomePageState extends State<MyHomePage> {
  List<MySuperHero> items = new List<MySuperHero>();

  _MyHomePageState() {
    items.add(new MySuperHero("assets/iron_man.png", "Iron Man",
        "Genius. Billionaire. Playboy. Philanthropist. Tony Stark's confidence is only matched by his high-flying abilities as the hero called Iron Man."));
    items.add(new MySuperHero("assets/captain_america.png", "Captain America",
        "Recipient of the Super-Soldier serum, World War II hero Steve Rogers fights for American ideals as one of the world’s mightiest heroes and the leader of the Avengers."));
    items.add(new MySuperHero("assets/thor.png", "Thor",
        "The son of Odin uses his mighty abilities as the God of Thunder to protect his home Asgard and planet Earth alike."));
    items.add(new MySuperHero("assets/hulk.png", "Hulk",
        "Dr. Bruce Banner lives a life caught between the soft-spoken scientist he’s always been and the uncontrollable green monster powered by his rage."));
    items.add(new MySuperHero("assets/black_widow.png", "Black Widow",
        "Despite super spy Natasha Romanoff’s checkered past, she’s become one of S.H.I.E.L.D.’s most deadly assassins and a frequent member of the Avengers."));
  }

  // ignore: non_constant_identifier_names
  Widget SuperHeroCell(BuildContext ctx, int index) {
    return GestureDetector(
      onTap: () {
        //PageRouteBuilder
        Navigator.of(context).push(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: Duration(milliseconds: 1200),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return MyDetailPage(items[index]);
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: child,
              );
            },
          ),
        );
      },
      child: Card(
          margin: EdgeInsets.all(12),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: items[index],
                      child: CircleAvatar(
                        radius: 32,
                        child: Image.asset(items[index].img),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      items[index].title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.navigate_next, color: Colors.black38),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => SuperHeroCell(context, index),
            ),
          ],
        ),
      ),
    );
  }
}
