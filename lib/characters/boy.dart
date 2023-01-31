import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyBoy extends StatelessWidget {
  final int boySpriteCount; // 0 for stading, 1-2 for walking
  final String direction;
  final String location;
  double height = 20;

  MyBoy({
    required this.boySpriteCount,
    required this.direction,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    if (location == 'littleroot') {
      height = 20;
    } else if (location == 'pokelab') {
      height = 30;
    } else if (location == 'battleground' ||
        location == 'attackoptions' ||
        location == 'battlefinishedscreeen') {
      height = 0;
    }

    return Container(
      height: height,
      child: Image.asset(
        'lib/images/boy$direction$boySpriteCount.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
