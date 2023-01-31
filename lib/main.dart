import 'package:flutter/material.dart';
import 'package:pokemon_game/button.dart';
import 'package:pokemon_game/characters/boy.dart';
import 'package:pokemon_game/maps/littleroot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
  VARIABLES
  */

  //littleroot
  double mapX = 0;
  double mapY = 0;

  //boy character
  int boySpriteCount = 0; // 0 for standing, 1-2 for walking
  String boyDirection = 'Down';

  // game stuff
  String currentMapLocation = 'littleroot';

  void moveUp() {
    boyDirection = 'Up';
    setState(() {
      mapY += 0.2;
    });
  }

  void moveDown() {
    boyDirection = 'Down';
    setState(() {
      mapY -= 0.2;
    });
  }

  void moveLeft() {
    boyDirection = 'Left';
    setState(() {
      mapX += 0.2;
    });
  }

  void moveRight() {
    boyDirection = 'Right';
    setState(() {
      mapX -= 0.2;
    });
  }

  void pressedA() {}

  void pressedB() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  //little root
                  LittleRoot(
                    x: mapX,
                    y: mapY,
                    currentMap: currentMapLocation,
                  ),

                  Container(
                    alignment: Alignment(0, 0),
                    child: MyBoy(
                      location: currentMapLocation,
                      boySpriteCount: boySpriteCount,
                      direction: boyDirection,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'G A M E B O Y',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          '  ♥  ',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        Text(
                          'F L A T T E R',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '←',
                                  function: moveLeft,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: '↑',
                                  function: moveUp,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '↓',
                                  function: moveDown,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '→',
                                  function: moveRight,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: 'b',
                                  function: pressedB,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: 'a',
                                  function: pressedA,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const Text('C R E A T E D B Y M E S O B',
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
