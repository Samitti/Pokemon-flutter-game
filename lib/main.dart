import 'dart:async';

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
  double mapX = 0.910;
  double mapY = 0.35;

  //boy character
  int boySpriteCount = 0; // 0 for standing, 1-2 for walking
  String boyDirection = 'Down';

  // game stuff
  String currentMapLocation = 'littleroot';
  double step = 0.25;

  // no mans land for littleroot
  List<List<double>> noMansLandLittleroot = [
    [-0.08, 1.85],
    [-0.33, 1.85],
  ];

  void moveUp() {
    boyDirection = 'Up';
    setState(() {
      mapY += step;
    });
    animateWalk();
  }

  void moveDown() {
    boyDirection = 'Down';
    setState(() {
      mapY -= step;
    });
    animateWalk();
  }

  void moveLeft() {
    boyDirection = 'Left';
    setState(() {
      mapX += step;
    });
    animateWalk();
  }

  void moveRight() {
    boyDirection = 'Right';
    setState(() {
      mapX -= step;
    });
    animateWalk();
  }

  void pressedA() {}

  void pressedB() {}

  void animateWalk() {
    print('X: ' + mapX.toString() + ', Y: ' + mapY.toString());

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });

      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

// function to determine no mans land
  // bool canMoveTo(String direction, var noMansLand, double x, double y) {
  //   double stepX = 0;
  //   double stepY = 0;

  //   if (direction == 'Left') {
  //     stepX = step;
  //     stepY = 0;
  //   } else if (direction == 'Right') {
  //     stepX = -step;
  //     stepY = 0;
  //   } else if (direction == 'Up') {
  //     stepX = 0;
  //     stepY = step;
  //   } else if (direction == 'Down') {
  //     stepX = 0;
  //     stepY = -step;
  //   }

  //   for (int i = 0; i < noMansLand.length; i++) {
  //     if((cleanNum(noMansLand[i][0]) == cleanNum(x + stepX)) &&
  //     (cleanNum(noMansLand[i][1]) == cleanNum(y+stepY))) {
  //       return false;
  //     }
  //   }
  //   return true;
  // }

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
